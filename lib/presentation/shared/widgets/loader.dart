import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class StyledLoader extends StatelessWidget {
  const StyledLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Styled.widget(child: const CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 3,
          ))
        .padding(all: 20)
        .decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ).elevation(5)
        .animate(const Duration(seconds: 5),Curves.decelerate)
        .elevation(15);
  }
}
