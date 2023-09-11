import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
     late TextEditingController user;
     late TextEditingController pass;
     final username = RxString("");
     final password = "".obs;
     final isObscure = RxBool(true);

  @override
  void onInit() async {
    user = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  setVisible(){
    isObscure.value = !isObscure.value;
  }



}