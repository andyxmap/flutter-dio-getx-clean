import 'package:flutter/widgets.dart';

class AppContainer extends StatelessWidget {

  Widget child;
  AppContainer({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(79, 184, 209, 1),
                  Color.fromRGBO(247, 249, 246,1)
                  
                ],
                begin: FractionalOffset(0.0, 2.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 2.0],
                tileMode: TileMode.clamp),
          ),
        width: size.width,
        height: size.height,
        child: child,
      );
  }
}