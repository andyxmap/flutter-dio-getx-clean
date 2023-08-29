import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class TokenResponse{
  String access;
  TokenUser user;
  
  
  TokenResponse(this.access,this.user);

  
}

@jsonSerializable
class TokenUser{
  String username;
  String email;
  int pk;

   TokenUser(this.username,this.email,this.pk);

}