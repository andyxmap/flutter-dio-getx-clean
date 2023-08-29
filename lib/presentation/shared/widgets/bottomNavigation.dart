import 'package:flutter/material.dart';

Widget createBolsaCustomBar (void Function(int) onTap) {
  return BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(
        activeIcon: Icon(
           Icons.home_filled,
            color: Color.fromARGB(255, 230, 232, 233),
        ),
        icon: Icon(
          Icons.home,
          color: Colors.deepPurpleAccent,
        ),
        label: ""
  ),
  BottomNavigationBarItem(
        activeIcon: Icon(
           Icons.add_box_outlined,
            color: Color.fromARGB(255, 230, 232, 233),
        ),
        icon: Icon(
          Icons.add_box,
          color: Colors.deepPurpleAccent,
        ),
        label: ""
  ),
    BottomNavigationBarItem(
        activeIcon: Icon(
            Icons.verified_user_outlined,
            color: Color.fromARGB(255, 230, 232, 233),
          ),
        icon: Icon(
            Icons.verified_user,
            color: Colors.deepPurpleAccent,
        ),
        label: ""
  )
  ],onTap: onTap );

}
