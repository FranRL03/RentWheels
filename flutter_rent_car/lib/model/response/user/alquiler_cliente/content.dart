import 'dart:convert';

import 'vehiculo.dart';

class Content {
  String? id;
  double? precio;
  int? kilometrosAnos;
  String? fechaCreacion;
  String? fechaInicio;
  String? fechaFin;
  String? origen;
  String? destino;
  bool? enAlquiler;
  Vehiculo? vehiculo;

  Content({
    this.id,
    this.precio,
    this.kilometrosAnos,
    this.fechaCreacion,
    this.fechaInicio,
    this.fechaFin,
    this.origen,
    this.destino,
    this.enAlquiler,
    this.vehiculo,
  });

  factory Content.fromAlquilerCliente(Map<String, dynamic> data) => Content(
        id: data['id'] as String?,
        precio: data['precio'] as double?,
        kilometrosAnos: data['kilometrosAnos'] as int?,
        fechaCreacion: data['fechaCreacion'] as String?,
        fechaInicio: data['fechaInicio'] as String?,
        fechaFin: data['fechaFin'] as String?,
        origen: data['origen'] as String?,
        destino: data['destino'] as String?,
        enAlquiler: data['enAlquiler'] as bool?,
        vehiculo: data['vehiculo'] == null
            ? null
            : Vehiculo.fromAlquilerCliente(
                data['vehiculo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toAlquilerCliente() => {
        'id': id,
        'precio': precio,
        'kilometrosAnos': kilometrosAnos,
        'fechaCreacion': fechaCreacion,
        'fechaInicio': fechaInicio,
        'fechaFin': fechaFin,
        'origen': origen,
        'destino': destino,
        'enAlquiler': enAlquiler,
        'vehiculo': vehiculo?.toAlquilerCliente(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
  factory Content.fromJson(String data) {
    return Content.fromAlquilerCliente(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
