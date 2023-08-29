class SimpleResponse{
  late String detail;
  late String message;
  late String status;
  
  SimpleResponse(this.detail,this.message,this.status);
 
 static dynamic fromJson(Map<String,dynamic> json){
       return SimpleResponse(
        json['detail'],
        json['message'],
        json['status']
       );
 }

}