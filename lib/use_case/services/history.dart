// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_getx_clean/data/model/history.dart';
import 'package:dio_getx_clean/data/repositories/history.dart';
import 'package:dio_getx_clean/use_case/entities/history.dart';

class HistoryService {
  HistoryRepository repository;
  HistoryService({
    required this.repository,
  });

  registerHistory(HistoryDto dto) {
    repository.addHistory(HistoryQr(code: dto.code));
  }

  Future<List<String>> allHistory() async {
      return repository.getAllHistory();
  }
}
