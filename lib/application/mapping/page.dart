import 'package:bolsa_flutter/domain/dto/req_user.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class PagedResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  

  PagedResponse(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data});

}