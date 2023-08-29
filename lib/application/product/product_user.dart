import 'dart:convert';

import 'package:bolsa_flutter/application/mapping/mapping.dart';
import 'package:bolsa_flutter/application/mapping/product_mapper.dart';
import 'package:bolsa_flutter/domain/dto/product_dto.dart';
import 'package:bolsa_flutter/infraestructure/interface/irest_api.dart';
import 'package:get/get.dart';

class ProductService {
  final IRestApi api = Get.find<IRestApi>();
  final JsonRestApi jsonApi = Get.find<JsonRestApi>();

  Future<List<UserProductDto>> fetchMockProducts() async{

    await Future.delayed(const Duration(seconds: 3));
    return [
      UserProductDto(amount: 4000,type: ProductType.ais),
      UserProductDto(amount: 5000,type: ProductType.ais),
      UserProductDto(amount: 6000,type: ProductType.ais)
    ];
  }

  Future<List<ProductUser>?> fetchUserProducts(String username) async{

     Map<String,String> body = <String,String>{};
     body.assign("username", username);
     var response = await api.postOne("/cliente/productos_por_cliente/", jsonEncode(body));
     return MappingUtil.requestfromMappingList<ProductUser>(response);
  }

}