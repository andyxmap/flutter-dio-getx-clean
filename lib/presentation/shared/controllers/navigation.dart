import 'package:bolsa_flutter/presentation/menu/pages/principal_user.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/create_bolsa.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/last_operation.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/pos.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/products_details.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/qr_pos.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/transfer.dart';
import 'package:bolsa_flutter/presentation/transfer/pages/user_products.dart';
import 'package:bolsa_flutter/presentation/user/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavigationRouterController extends GetxController {
  RxBool isObscure = true.obs;

  void navigateToBolsa(){
    Get.to(const CreateBolsa());
  }
  void navigateToNamedBolsa(){
    Get.toNamed("mibolsa");
  }

  void navigateToNamedLogin(){
    Get.toNamed("login");
  }

  void navigateLogin(){
    Get.to(LoginView());
  }

  void navigateToPos(){
    Get.to(PosPage(),
     transition: Transition.downToUp
    );
  }

  void showDialog(Widget content){
      Get.defaultDialog(
        title: "Configuración",
        contentPadding: const EdgeInsets.all(12),
        content: content
      );
  }

  navigateToProducts() {
    Get.to(UserProducts(),
     transition: Transition.downToUp
    );
  }

  navigateProductsDetail() {
     Get.to(ProductsDetails(),
     transition: Transition.downToUp
    );
  }

  navigateMenu(){
    Get.to(MenuPrincipalByUser());
  }

  navigateToTransfer() {
    Get.to(const TransferPage(),
     transition: Transition.downToUp
    );
  }

  void lastOperation() {
    Get.to(const LastTransferPage(),
     transition: Transition.downToUp
    );
  }

  void qrPosPage() {
    Get.to(ScanQrPage(),
     transition: Transition.downToUp
    );
  }
}
