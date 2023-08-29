import 'package:bolsa_flutter/application/mapping/mapping.dart';
import 'package:bolsa_flutter/application/product/product_user.dart';
import 'package:bolsa_flutter/application/user/user_service.dart';
import 'package:bolsa_flutter/presentation/transfer/controllers/products_controller.dart';
import 'package:bolsa_flutter/presentation/user/controller/register_controller.dart';
import 'package:get/get.dart';
import 'package:bolsa_flutter/infraestructure/interface/irest_api.dart';
import 'package:bolsa_flutter/presentation/shared/controllers/navigation.dart';
import 'package:bolsa_flutter/presentation/shared/controllers/store.dart';
import '../presentation/menu/controllers/principal.dart';
import '../presentation/user/controller/log_in.dart';

// en esta clase se inicializan todos los controlladores que se utilizaran en la aplicacion 

class DependencyInjection {
 static Future<void> init() async {
   Get.put<GetConnect>(GetConnect()); //inicializar GetConnect
   Get.put<JsonRestApi>(JsonRestApi(baseUrl: "https://prodfinback-dev.cimex.com.cu"));

   IRestApi fincimexApi = IRestApi(baseUrl: "https://prodfinback-dev.cimex.com.cu");
   fincimexApi.modifyRequest(MappingUtil.setAuth2Request);
   Get.put<IRestApi>(fincimexApi);


   Get.put<NavigationRouterController>(NavigationRouterController()); 
   Get.put<StoreController>(StoreController()); 
   //Controlladores
   // para navegar entre rutas, mostrar dialogos, alertas antes de ejecutar navegaciones ect; 


   //Servicios
   Get.put<UserService>(UserService());
   Get.put<ProductService>(ProductService());

   // inicializa el shared storage
   Get.put<LoginController>(LoginController()); // inicializa el login
   Get.put<RegisterController>(RegisterController()); // inicializa el registro
   Get.put<PrincipalController>(PrincipalController()); // inicializa el menú principal
   Get.put<ProductController>(ProductController());
 

 }
}