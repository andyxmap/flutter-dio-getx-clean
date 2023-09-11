// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoryQr {
  String code;
  late DateTime date;
  HistoryQr({
    required this.code,
  }) {
    date = DateTime.now();
  }
}
