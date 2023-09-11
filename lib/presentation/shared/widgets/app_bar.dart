import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class AppBarBuilder{
  
static PreferredSizeWidget toPreviusRouteBackAppBuilder(bool useWhite,Widget textWidget, {List<Widget>? actions}){
     return  GFAppBar(
      backgroundColor: useWhite ? Colors.white : const Color.fromRGBO(79, 184, 209, 1),
  leading:  GFIconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    onPressed: () {
      Get.back();
    },
    type: GFButtonType.transparent,
  ),
  title: textWidget,
  actions: actions,
);
  }

}