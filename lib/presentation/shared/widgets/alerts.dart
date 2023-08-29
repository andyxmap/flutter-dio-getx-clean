
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAlert{
     static void constructErrorAlert({String? error}){
         String newError = error ?? "Ocurrio un error inesperado";
        
         Get.defaultDialog(
          title:"Mensaje",
          content: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                   const Icon(Icons.error,color: Colors.redAccent,size: 40,),
                   const SizedBox(width: 10,),
                   Expanded(child: Text(newError,style: const TextStyle(
                    fontWeight: FontWeight.w800
                   ),))
              ],
            ),
          )
         );
    }

    static void constructInfoAlert({String? info}){
         String newInfo = info ?? "Operacion satisfactoria";
        
         Get.defaultDialog(
          title:"Mensaje",
          content: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                   const Icon(Icons.check,color: Colors.greenAccent,size: 40,),
                   const SizedBox(width: 10,),
                   Expanded(child: Text(newInfo,style: const TextStyle(
                    fontWeight: FontWeight.w800
                   ),))
              ],
            ),
          )
         );
    }
}