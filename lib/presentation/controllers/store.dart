import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class StoreController extends GetxController {
  final globalStorage = GetStorage();

  Future<void> setString(String key, String value, {bool writeIfnull = false}) async {
        writeValue(key, value, writeIfnull);
  }
  Future<void> setNumber(String key, double value, {bool writeIfnull = false}) async{
        writeValue(key, value, writeIfnull);
  }
  Future<void> setBool(String key, bool value, {bool writeIfnull = false}) async{
        writeValue(key, value, writeIfnull);
  }

  Future<void> writeValue<T>(String key, T value, bool writeIfnull) async {
        if(writeIfnull){
           globalStorage.writeIfNull(key, value);
        }else{
          globalStorage.write(key, value);
        }
  }

  T? readValue<T>(String key) {
            return globalStorage.read<T>(key);
  }
}
