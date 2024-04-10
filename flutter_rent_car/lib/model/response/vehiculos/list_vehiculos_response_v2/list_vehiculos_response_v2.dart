import 'dart:convert';

class ListVehiculosResponseV2 {
  String? id;
  String? imagen;
  String? modelo;
  String? combustion;
  String? transmision;
  bool? disponible;
  double? precioBase;

  ListVehiculosResponseV2({
    this.id,
    this.imagen,
    this.modelo,
    this.combustion,
    this.transmision,
    this.disponible,
    this.precioBase,
  });

  factory ListVehiculosResponseV2.fromListVehiculos(Map<String, dynamic> data) {
    return ListVehiculosResponseV2(
      id: data['id'] as String?,
      imagen: data['imagen'] as String?,
      modelo: data['modelo'] as String?,
      combustion: data['combustion'] as String?,
      transmision: data['transmision'] as String?,
      disponible: data['disponible'] as bool?,
      precioBase: (data['precioBase'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toListVehiculos() => {
        'id': id,
        'imagen': imagen,
        'modelo': modelo,
        'combustion': combustion,
        'transmision': transmision,
        'disponible': disponible,
        'precioBase': precioBase,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListVehiculosResponseV2].
  factory ListVehiculosResponseV2.fromJson(String data) {
    return ListVehiculosResponseV2.fromListVehiculos(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ListVehiculosResponseV2] to a JSON string.
  String toJson() => json.encode(toListVehiculos());
}
