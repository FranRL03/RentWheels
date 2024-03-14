import 'dart:convert';

import 'modelo.dart';

class VehiculoDetailsResponse {
  String? id;
  String? combustion;
  Modelo? modelo;
  String? imagen;
  String? transmision;
  int? capacidadPasajeros;
  int? autonomia;
  int? potencia;
  String? estado;
  int? numPuertas;
  bool? disponible;
  double? precioBase;

  VehiculoDetailsResponse({
    this.id,
    this.combustion,
    this.modelo,
    this.imagen,
    this.transmision,
    this.capacidadPasajeros,
    this.autonomia,
    this.potencia,
    this.estado,
    this.numPuertas,
    this.disponible,
    this.precioBase
  });

  factory VehiculoDetailsResponse.fromVehiculoDetails(
      Map<String, dynamic> data) {
    return VehiculoDetailsResponse(
      id: data['id'] as String?,
      combustion: data['combustion'] as String?,
      modelo: data['modelo'] == null
          ? null
          : Modelo.fromVehiculoDetails(data['modelo'] as Map<String, dynamic>),
      imagen: data['imagen'] as String?,
      transmision: data['transmision'] as String?,
      capacidadPasajeros: data['capacidadPasajeros'] as int?,
      autonomia: data['autonomia'] as int?,
      potencia: data['potencia'] as int?,
      estado: data['estado'] as String?,
      numPuertas: data['numPuertas'] as int?,
      disponible: data['disponible'] as bool?,
      precioBase: data['precioBase'] as double?
    );
  }

  Map<String, dynamic> toVehiculoDetails() => {
        'id': id,
        'combustion': combustion,
        'modelo': modelo?.toVehiculoDetails(),
        'imagen': imagen,
        'transmision': transmision,
        'capacidadPasajeros': capacidadPasajeros,
        'autonomia': autonomia,
        'potencia': potencia,
        'estado': estado,
        'numPuertas': numPuertas,
        'disponible': disponible,
        'precioBase': precioBase
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VehiculoDetailsResponse].
  factory VehiculoDetailsResponse.fromJson(String data) {
    return VehiculoDetailsResponse.fromVehiculoDetails(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VehiculoDetailsResponse] to a JSON string.
  String toJson() => json.encode(toVehiculoDetails());
}
