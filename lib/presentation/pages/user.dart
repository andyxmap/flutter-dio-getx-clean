import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:dio_getx_clean/presentation/controllers/navigation.dart';
import 'package:dio_getx_clean/presentation/controllers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserWidgetScreen extends StatelessWidget {
  UserWidgetScreen({super.key});
  final UserController controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              
              ),
            controller: controller.user,
          ),
          Obx(() => TextField(
            controller: controller.pass,
            obscureText: controller.isObscure.value,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: (){
                  controller.setVisible();
                },
                icon: Icon(controller.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                                
                                ),
              )
              ),
          )),
          
          ConnectivityWidgetWrapper(
            stacked: false,
            offlineWidget: const FilledButton(
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Connecting",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  
                    CupertinoActivityIndicator(radius: 8.0),
                  ],
                ),
              ),
            ),
            child: FilledButton(
              
              onPressed: () {},
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}