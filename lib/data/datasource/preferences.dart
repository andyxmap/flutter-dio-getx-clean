// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource {
  final SharedPreferences prefs;
  SharedPreferencesDataSource({
    required this.prefs,
  });

  writeString(String key, String value) {
    prefs.setString(key, value);
  }

  writeStringList(String key, List<String> value) {
    prefs.setStringList(key, value);
  }

  removeAndWriteList(String key, List<String> value) async {
    await prefs.remove(key);
    prefs.setStringList(key, value);
  }

  List<String> getValueList(String key) {
    var stringList = prefs.getStringList(key);
    return stringList ?? List.empty(growable: true);
  }
}
