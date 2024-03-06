import 'dart:convert';

import 'modelo.dart';

class Vehiculo {
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

  Vehiculo({
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
  });

  factory Vehiculo.fromAlquilerCliente(Map<String, dynamic> data) {
    return Vehiculo(
      combustion: data['combustion'] as String?,
      modelo: data['modelo'] == null
          ? null
          : Modelo.fromAlquilerCliente(data['modelo'] as Map<String, dynamic>),
      imagen: data['imagen'] as String?,
      transmision: data['transmision'] as String?,
      capacidadPasajeros: data['capacidadPasajeros'] as int?,
      autonomia: data['autonomia'] as int?,
      potencia: data['potencia'] as int?,
      estado: data['estado'] as String?,
      numPuertas: data['numPuertas'] as int?,
      disponible: data['disponible'] as bool?,
    );
  }

  Map<String, dynamic> toAlquilerCliente() => {
        'combustion': combustion,
        'modelo': modelo?.toAlquilerCliente(),
        'imagen': imagen,
        'transmision': transmision,
        'capacidadPasajeros': capacidadPasajeros,
        'autonomia': autonomia,
        'potencia': potencia,
        'estado': estado,
        'numPuertas': numPuertas,
        'disponible': disponible,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Vehiculo].
  factory Vehiculo.fromJson(String data) {
    return Vehiculo.fromAlquilerCliente(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Vehiculo] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
