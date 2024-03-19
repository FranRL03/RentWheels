import 'dart:convert';

class Content {
  String? id;
  String? imagen;
  String? modelo;
  String? combustion;
  String? transmision;
  bool? disponible;
  double? precioBase;

  Content(
      {this.id,
      this.imagen,
      this.modelo,
      this.combustion,
      this.transmision,
      this.disponible,
      this.precioBase});

  factory Content.fromListVehiculos(Map<String, dynamic> data) => Content(
        id: data['id'] as String?,
        imagen: data['imagen'] as String?,
        modelo: data['modelo'] as String?,
        combustion: data['combustion'] as String?,
        transmision: data['transmision'] as String?,
        disponible: data['disponible'] as bool?,
        precioBase: data['precioBase'] as double?
      );

  Map<String, dynamic> toListVehiculos() => {
        'id': id,
        'imagen': imagen,
        'modelo': modelo,
        'combustion': combustion,
        'transmision': transmision,
        'disponible': disponible,
        'precioBase': precioBase
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
  factory Content.fromJson(String data) {
    return Content.fromListVehiculos(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
  String toJson() => json.encode(toListVehiculos());
}
