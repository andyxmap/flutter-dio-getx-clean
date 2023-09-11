import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

Widget builder(context, snapshot, Widget builderWidget) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return buildLoader();
  } else if (snapshot.hasError) {
    
     Get.snackbar("Error", "Ocurrio un error inesperado");

    return buildErrorWidget(snapshot);
  } else if (snapshot.hasData) {
    return builderWidget;
  }
  return Container();
}

Center buildErrorWidget(snapshot) {
  final error = snapshot.error;

  return Center(
    child: SizedBox(
      width: 200,
      height: 100,
      child: Card(
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(error.toString()),
            )
          ],
        ),
      ),
    ),
  );
}

Center buildLoader() {
  return Center(
      child: LoadingBouncingGrid.square(
    borderColor: Colors.cyan,
    borderSize: 3.0,
    size: 100.0,
    backgroundColor: Colors.cyanAccent,
    duration: const Duration(milliseconds: 1000),
  ));
}
