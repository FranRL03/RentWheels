import 'dart:convert';

class ModeloResponse {
	String? modelo;
	String? logo;

	ModeloResponse({this.modelo, this.logo});

	factory ModeloResponse.fromModeloResponse(Map<String, dynamic> data) {
		return ModeloResponse(
			modelo: data['modelo'] as String?,
			logo: data['logo'] as String?,
		);
	}



	Map<String, dynamic> toModeloResponse() => {
				'modelo': modelo,
				'logo': logo,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ModeloResponse].
	factory ModeloResponse.fromJson(String data) {
		return ModeloResponse.fromModeloResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ModeloResponse] to a JSON string.
	String toJson() => json.encode(toModeloResponse());
}
