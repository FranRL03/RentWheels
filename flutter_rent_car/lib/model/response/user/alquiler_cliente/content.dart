import 'dart:convert';

import 'vehiculo.dart';

class Content {
  String? id;
  double? precio;
  int? kilometrosPorAno;
  String? fechaInicio;
  String? fechaFin;
  bool? enAlquiler;
  Vehiculo? vehiculo;

  Content({
    this.id,
    this.precio,
    this.kilometrosPorAno,
    this.fechaInicio,
    this.fechaFin,
    this.enAlquiler,
    this.vehiculo,
  });

  factory Content.fromAlquilerCliente(Map<String, dynamic> data) => Content(
        id: data['id'] as String?,
        precio: (data['precio'] as num?)?.toDouble(),
        kilometrosPorAno: data['kilometrosPorAno'] as int?,
        fechaInicio: data['fechaInicio'] as String?,
        fechaFin: data['fechaFin'] as String?,
        enAlquiler: data['enAlquiler'] as bool?,
        vehiculo: data['vehiculo'] == null
            ? null
            : Vehiculo.fromAlquilerCliente(
                data['vehiculo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toAlquilerCliente() => {
        'id': id,
        'precio': precio,
        'kilometrosPorAno': kilometrosPorAno,
        'fechaInicio': fechaInicio,
        'fechaFin': fechaFin,
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
