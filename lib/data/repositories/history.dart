// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_getx_clean/data/datasource/preferences.dart';
import 'package:dio_getx_clean/data/model/history.dart';

class HistoryRepository {

   SharedPreferencesDataSource source;

  HistoryRepository({
    required this.source,
  });

  addHistory(HistoryQr history){
      List<String> histories = source.getValueList('history');
      histories.add(history.code);
      source.writeStringList('history', histories);
  }

  Future<List<String>> getAllHistory() async {
     return source.getValueList('history');
  }

}
