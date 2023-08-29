import 'package:bolsa_flutter/infraestructure/core/responses_types.dart';

class ApiException implements Exception {
    String cause;
    Map<String,dynamic> errors;
    ApiException(this.cause,this.errors);

    static void throwPreparedApiException(ResponseContextType context){
        String cause = "";
        if(context.connectionError){
          cause = "Error de Conexión";
        }
        else if(context.permissionError){
          cause = "No esta autorizado a realizar esta operación";
        }
        else if(context.hasError){
          cause = "Error desconocido";
        }

        throw ApiException(cause, context.convertError2DartValue());
    }

    static void throwPreparedJsonApiException(JsonContextType context){
        String cause = "";
        if(context.connectionError){
          cause = "Error de Conexión";
        }
        else if(context.permissionError){
          cause = "No esta autorizado a realizar esta operación";
        }
        else if(context.hasError){
          cause = "!Woo! parece que algo va mal en nuestros servidores";
        }

        throw ApiException(cause, context.convertError2DartValue());
    }
}