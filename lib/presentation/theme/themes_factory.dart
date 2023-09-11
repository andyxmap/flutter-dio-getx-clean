import 'package:flutter/material.dart';

class ThemeFactory {
     static ThemeData buildBaseTheme(){
         return ThemeData(
             colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(79, 184, 209, 1)),
             primaryColor:const Color.fromRGBO(79, 184, 209, 1),
             iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: MaterialStateProperty.all(const Color.fromRGBO(247, 249, 246,1))
              )
             ),
             primaryColorLight: const Color.fromRGBO(247, 249, 246,1),
             fontFamily: 'Exo',
             useMaterial3: true,
             buttonTheme: const ButtonThemeData(
              buttonColor: Color.fromRGBO(79, 184, 209, 1)
             ),
             textTheme: const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
              displaySmall: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Colors.white),
              displayMedium: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
              displayLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)
             ),
             elevatedButtonTheme: ElevatedButtonThemeData(
              style:  ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(79, 184, 209, 1)),
                elevation: const MaterialStatePropertyAll(10),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.w300, fontSize: 20, decorationColor: Color.fromARGB(255, 145, 25, 25)
                ))
                )
             )
         );
     }
}