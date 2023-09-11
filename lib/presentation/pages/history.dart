import 'package:dio_getx_clean/presentation/controllers/history.dart';
import 'package:dio_getx_clean/presentation/shared/widgets/builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends GetView<HistoryController>{

  @override
  Widget build(BuildContext context) {
       return Obx(() => ListView.builder(
        itemCount: controller.qrhistory.length,
        itemBuilder: (context,index){
                  return ListTile(
                    title: Text(controller.qrhistory.elementAt(index)),
                  );
       }));
  } 

}