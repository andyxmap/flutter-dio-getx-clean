import 'package:bolsa_flutter/presentation/shared/controllers/navigation.dart';
import 'package:bolsa_flutter/presentation/shared/widgets/drawerItems.dart';
import 'package:bolsa_flutter/presentation/user/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppDrawerBuilder {
  static Widget backAppDrawerBuilder(BuildContext context,NavigationRouterController controller) {

    return GFDrawer(
      gradient: LinearGradient(colors: [
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColorLight
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          const Center(
            child:  GFAvatar(child:Image(image:AssetImage("assets/PERFIL.png"),width: 50,height: 50,),
          )),
          Expanded(
            flex:2,
              child: ListView(
            padding: const EdgeInsets.all(40),
            children: [
              SettingsItem("Productos", const AssetImage("assets/PRODUCTOS.png")),
              SettingsItem("Etecsa", const AssetImage("assets/ETECSA.png")),
              SettingsItem("Une", const AssetImage("assets/UNE.png")),
              SettingsItem("Aguas de la Habana",const AssetImage("assets/AGUAS.png")),
              SettingsItem("Cupet",const AssetImage("assets/CUPET.png")),
              SettingsItem("Últimas Operaciones",const AssetImage("assets/ULTIMAS.png")),
              SettingsItem("Transferir",const AssetImage("assets/TRANSFERIR.png"),onTap: controller.navigateToTransfer),
              SettingsItem("Pago por POS",const AssetImage("assets/PAGOPOS.png"), onTap: controller.qrPosPage,)
            ],
          )),
          Expanded(
            flex: -1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(children: [
                  GestureDetector(
                    onTap: () => controller.showDialog(const Settings()),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      child: const Icon(Icons.settings_outlined)),
                  ),
                  GestureDetector(
                    onTap:()=> controller.navigateLogin(),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Theme.of(context).primaryColorLight,
                      child: const Icon(Icons.logout_outlined)),
                  )
                ],),
              ],
            ))
        ],
      ),
    );
  }
}
