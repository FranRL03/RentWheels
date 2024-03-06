import 'dart:convert';

class Content {
  String? imagen;
  String? modelo;
  String? combustion;
  String? transmision;
  bool? disponible;

  Content(
      {this.imagen,
      this.modelo,
      this.combustion,
      this.transmision,
      this.disponible});

  factory Content.fromListVehiculos(Map<String, dynamic> data) => Content(
        imagen: data['imagen'] as String?,
        modelo: data['modelo'] as String?,
        combustion: data['combustion'] as String?,
        transmision: data['transmision'] as String?,
        disponible: data['disponible'] as bool?,
      );

  Map<String, dynamic> toListVehiculos() => {
        'imagen': imagen,
        'modelo': modelo,
        'combustion': combustion,
        'transmision': transmision,
        'disponible': disponible,
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
