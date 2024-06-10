import 'dart:convert';

class ModeloResponseV2 {
  String? modelo;
  String? logo;

  ModeloResponseV2({this.modelo, this.logo});

  factory ModeloResponseV2.fromModeloResponseV2(Map<String, dynamic> data) {
    return ModeloResponseV2(
      modelo: data['modelo'] as String?,
      logo: data['logo'] as String?,
    );
  }

  Map<String, dynamic> toModeloResponseV2() => {
        'modelo': modelo,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ModeloResponseV2].
  factory ModeloResponseV2.fromJson(String data) {
    return ModeloResponseV2.fromModeloResponseV2(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ModeloResponseV2] to a JSON string.
  String toJson() => json.encode(toModeloResponseV2());
}
