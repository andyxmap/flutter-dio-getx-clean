import 'package:dio_getx_clean/data/datasource/preferences.dart';
import 'package:dio_getx_clean/data/repositories/history.dart';
import 'package:dio_getx_clean/presentation/controllers/history.dart';
import 'package:dio_getx_clean/presentation/controllers/navigation.dart';
import 'package:dio_getx_clean/presentation/controllers/store.dart';
import 'package:dio_getx_clean/presentation/controllers/user.dart';
import 'package:dio_getx_clean/use_case/services/history.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// en esta clase se inicializan todos los controlladores que se utilizaran en la aplicacion

class DependencyInjection {
  static Future<void> init() async {
    Get.put<NavigationRouterController>(NavigationRouterController());
    Get.put<StoreController>(StoreController());
    Get.put<UserController>(UserController());

    //Inyectando las preferences
    await Get.putAsync<SharedPreferencesDataSource>(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('counter', 12345);
      var source = SharedPreferencesDataSource(prefs: prefs);
      Get.put(HistoryService(repository: HistoryRepository(source: source)));
      Get.lazyPut(() => HistoryController());
      return source;
    });


    
  }
}
