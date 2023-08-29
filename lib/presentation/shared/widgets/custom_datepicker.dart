
import 'package:flutter/material.dart';


class CustomDatePicker extends StatefulWidget {
  String? label = "Introduzca una fecha";

  final void Function(DateTime date)  onTap;

  CustomDatePicker({super.key,required this.onTap,this.label});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
                child: TextField(
              controller: dateInput,
              
              decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today), 
                  labelText: widget.label
                  ),
              readOnly: true,
              
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate);
                  
                  setState(() {
                    dateInput.text =
                        pickedDate.toString();
                    widget.onTap(pickedDate);
                  });
                } else {}
              },
            ));
  }
}