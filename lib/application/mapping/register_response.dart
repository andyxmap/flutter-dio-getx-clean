import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable, JsonProperty;

@jsonSerializable
class RegisterResponse{

  @JsonProperty(name: 'detail')
  late String detail;
  late String message;
  late String status;
  
  RegisterResponse(this.detail,this.message,this.status);
 
 

}