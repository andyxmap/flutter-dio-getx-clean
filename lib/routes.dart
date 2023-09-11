import 'package:dio_getx_clean/presentation/pages/qr_page.dart';
import 'package:get/get.dart';

import 'presentation/pages/user.dart';

class AppRouter{

  static getPages(){
    return [
      GetPage(name: "/login", page: () => UserWidgetScreen()),
      GetPage(
        name: '/',
        page: () => ScanQrPage(),
      ),
      
    ];
  }
}