import 'dart:convert';

import 'package:bolsa_flutter/application/exceptions/api_exceptions.dart';
import 'package:bolsa_flutter/application/mapping/mapping.dart';
import 'package:bolsa_flutter/application/mapping/page.dart';
import 'package:bolsa_flutter/application/mapping/register_response.dart';
import 'package:bolsa_flutter/application/viewObjects/use_case.dart';
import 'package:bolsa_flutter/domain/dto/req_user.dart';
import 'package:bolsa_flutter/domain/dto/user.dart';
import 'package:bolsa_flutter/application/mapping/token.dart';
import 'package:bolsa_flutter/infraestructure/core/responses_types.dart';
import 'package:bolsa_flutter/infraestructure/interface/irest_api.dart';
import 'package:get/get.dart';

class UserService {
  final IRestApi api = Get.find<IRestApi>();
  final JsonRestApi jsonApi = Get.find<JsonRestApi>();

  Future<RegisterResponse?> registerUser(
      RegisterUser user) async {
    
    RegisterResponse? response;
    /*var responseContextType =
        await api.postOne<dynamic>("cliente/crear", jsonEncode(user));
    UseCase<SimpleResponse> useCaseResponse =
        UseCase<SimpleResponse>(responseContextType.connectionError);

    if (responseContextType.isOk) {
      useCaseResponse.data = SimpleResponse.fromJson(responseContextType.data);
    } else {
      useCaseResponse.errors = responseContextType.convertError2DartValue();
      ApiException.throwPreparedApiException(responseContextType);
    }
    return useCaseResponse;*/
    JsonContextType<RegisterResponse> jsonResponse = await jsonApi.post<RegisterResponse>("cliente/crear", jsonEncode(user));
     if (jsonResponse.isOk) {
      response = jsonResponse.data;
    }else{
       ApiException.throwPreparedJsonApiException(jsonResponse);
    }
    
    return response;

  }

  Future<TokenResponse?> login(UserLogin userLogin) async {
    var responseContextType =
        await api.postOne("user/login/", jsonEncode(userLogin));
    
    return MappingUtil.requestfromMapping<TokenResponse>(responseContextType);
    }

  Future<PagedResponse?> getAllUsers() async {
    api.baseUrl = "https://reqres.in/api";
    var response = await api.get("users");
    return MappingUtil.requestfromMapping<PagedResponse>(response);
  }
}
