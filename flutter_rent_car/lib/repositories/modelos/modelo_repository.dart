import 'package:flutter_rent_car/model/response/modelo/modelo_response_v2/modelo_response_v2.dart';

abstract class ModeloRepository {
  Future <List<ModeloResponseV2>> models();
}
