import 'package:get/get.dart';


class NavigationRouterController extends GetxController {
  
  void navigateToNamedHome(){
    Get.toNamed("/");
  }
  
  void navigateToNamedUser(){
    Get.toNamed("/login");
  }

}
