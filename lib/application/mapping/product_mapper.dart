import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable, JsonProperty;

@jsonSerializable
class ProductUser {

  int? cliente;

  @JsonProperty(name: 'nombre_producto')
  String? nombreProducto;

  @JsonProperty(name: 'tipo_producto')
  int tipo;

  String? serie;

  ProductUser(this.cliente,this.nombreProducto,this.tipo,this.serie);

}
