import 'package:flutter/material.dart';

class CenterBottomAppBar extends StatelessWidget {
  List<Widget> children = const <Widget>[];
  CenterBottomAppBar({super.key,required this.children});

  @override
  Widget build(BuildContext context) {
     return BottomAppBar(
          color: Colors.indigo,
          notchMargin: 6.0,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children)));
  }
}
  
