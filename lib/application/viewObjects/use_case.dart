class UseCase<T>{
  T? data;
  Map<String,dynamic>? errors;
  bool connectionError =  false;

  UseCase(this.connectionError,{this.data,this.errors});
}