import 'dart:convert';

import 'vehiculo.dart';

class AlquilerResponse {
  String? id;
  double? precio;
  int? kilometrosAnos;
  String? fechaInicio;
  String? fechaFin;
  bool? enAlquiler;
  Vehiculo? vehiculo;

  AlquilerResponse({
    this.id,
    this.precio,
    this.kilometrosAnos,
    this.fechaInicio,
    this.fechaFin,
    this.enAlquiler,
    this.vehiculo,
  });

  factory AlquilerResponse.fromAlquilerResponse(Map<String, dynamic> data) {
    return AlquilerResponse(
      id: data['id'] as String?,
      precio: data['precio'] as double?,
      kilometrosAnos: data['kilometrosAnos'] as int?,
      fechaInicio: data['fechaInicio'] as String?,
      fechaFin: data['fechaFin'] as String?,
      enAlquiler: data['enAlquiler'] as bool?,
      vehiculo: data['vehiculo'] == null
          ? null
          : Vehiculo.fromAlquilerResponse(
              data['vehiculo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toAlquilerResponse() => {
        'id': id,
        'precio': precio,
        'kilometrosAnos': kilometrosAnos,
        'fechaInicio': fechaInicio,
        'fechaFin': fechaFin,
        'enAlquiler': enAlquiler,
        'vehiculo': vehiculo?.toAlquilerResponse(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AlquilerResponse].
  factory AlquilerResponse.fromJson(String data) {
    return AlquilerResponse.fromAlquilerResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AlquilerResponse] to a JSON string.
  String toJson() => json.encode(toAlquilerResponse());
}
