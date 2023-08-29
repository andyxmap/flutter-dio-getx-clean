import 'dart:async';

import 'package:bolsa_flutter/application/exceptions/api_exceptions.dart';
import 'package:bolsa_flutter/infraestructure/core/responses_types.dart';
import 'package:bolsa_flutter/presentation/shared/controllers/store.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class MappingUtil{
  static T? requestfromMapping<T>(ResponseContextType context){
     
        if(context.hasError){
            ApiException.throwPreparedApiException(context);
         }

         return JsonMapper.deserialize<T>(context.contextResponse.bodyString);
  }

  static List<T>? requestfromMappingList<T>(ResponseContextType context){
     
        if(context.hasError){
            ApiException.throwPreparedApiException(context);
         }

         return JsonMapper.deserialize<List<T>>(context.contextResponse.bodyString);
  }

  static FutureOr<Request> setAuth2Request(Request<dynamic> request) async{
         if(!request.url.toString().contains("login")){
            var token = Get.find<StoreController>().readValue("token");
            var headers = {'Authorization': "Bearer $token"};
            request.headers.addAll(headers);
         }
        
         return request;
  }
}