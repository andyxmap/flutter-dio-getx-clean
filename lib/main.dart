import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:dio_getx_clean/di/dependency_injection.dart';
import 'package:dio_getx_clean/di/log_notification.dart';
import 'package:dio_getx_clean/presentation/theme/themes_factory.dart';
import 'package:dio_getx_clean/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); // 
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: GetMaterialApp(
        initialRoute: "/",
        getPages: AppRouter.getPages(),
        title: 'QR',
        theme: ThemeFactory.buildBaseTheme(),
      ),
    );
  }
}
