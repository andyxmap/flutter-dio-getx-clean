import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkAwareWidgetScreen extends StatelessWidget {
  const NetworkAwareWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          
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