import 'dart:convert';

class Content {
  String? modelo;
  String? logo;

  Content({this.modelo, this.logo});

  factory Content.fromModeloResponse(Map<String, dynamic> data) => Content(
        modelo: data['modelo'] as String?,
        logo: data['logo'] as String?,
      );

  Map<String, dynamic> toModeloResponse() => {
        'modelo': modelo,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
  factory Content.fromJson(String data) {
    return Content.fromModeloResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
  String toJson() => json.encode(toModeloResponse());
}
