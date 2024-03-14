import 'dart:convert';

import 'modelo.dart';

class Vehiculo {
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
  int? precioBase;

  Vehiculo({
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
    this.precioBase,
  });

  factory Vehiculo.fromAlquilerResponse(Map<String, dynamic> data) {
    return Vehiculo(
      id: data['id'] as String?,
      combustion: data['combustion'] as String?,
      modelo: data['modelo'] == null
          ? null
          : Modelo.fromAlquilerResponse(data['modelo'] as Map<String, dynamic>),
      imagen: data['imagen'] as String?,
      transmision: data['transmision'] as String?,
      capacidadPasajeros: data['capacidadPasajeros'] as int?,
      autonomia: data['autonomia'] as int?,
      potencia: data['potencia'] as int?,
      estado: data['estado'] as String?,
      numPuertas: data['numPuertas'] as int?,
      disponible: data['disponible'] as bool?,
      precioBase: data['precioBase'] as int?,
    );
  }

  Map<String, dynamic> toAlquilerResponse() => {
        'id': id,
        'combustion': combustion,
        'modelo': modelo?.toAlquilerResponse(),
        'imagen': imagen,
        'transmision': transmision,
        'capacidadPasajeros': capacidadPasajeros,
        'autonomia': autonomia,
        'potencia': potencia,
        'estado': estado,
        'numPuertas': numPuertas,
        'disponible': disponible,
        'precioBase': precioBase,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Vehiculo].
  factory Vehiculo.fromJson(String data) {
    return Vehiculo.fromAlquilerResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Vehiculo] to a JSON string.
  String toJson() => json.encode(toAlquilerResponse());
}
