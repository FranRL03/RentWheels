import 'dart:convert';

class Modelo {
  String? modelo;
  String? logo;

  Modelo({this.modelo, this.logo});

  factory Modelo.fromAlquilerCliente(Map<String, dynamic> data) => Modelo(
        modelo: data['modelo'] as String?,
        logo: data['logo'] as String?,
      );

  Map<String, dynamic> toAlquilerCliente() => {
        'modelo': modelo,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Modelo].
  factory Modelo.fromJson(String data) {
    return Modelo.fromAlquilerCliente(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Modelo] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
