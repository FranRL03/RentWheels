import 'dart:convert';

class Content {
  String? imagen;
  String? combustion;
  bool? disponible;

  Content({this.imagen, this.combustion, this.disponible});

  factory Content.fromListVehiculos(Map<String, dynamic> data) => Content(
        imagen: data['imagen'] as String?,
        combustion: data['combustion'] as String?,
        disponible: data['disponible'] as bool?,
      );

  Map<String, dynamic> toListVehiculos() => {
        'imagen': imagen,
        'combustion': combustion,
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
