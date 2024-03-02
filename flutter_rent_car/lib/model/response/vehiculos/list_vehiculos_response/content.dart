import 'dart:convert';

import 'modelo.dart';

class Content {
	String? combustion;
	Modelo? modelo;
	String? imagen;
	String? transmision;

	Content({this.combustion, this.modelo, this.imagen, this.transmision});

	factory Content.fromVehiculosResponse(Map<String, dynamic> data) {
		return Content(
			combustion: data['combustion'] as String?,
			modelo: data['modelo'] == null
						? null
						: Modelo.fromVehiculosResponse(data['modelo'] as Map<String, dynamic>),
			imagen: data['imagen'] as String?,
			transmision: data['transmision'] as String?,
		);
	}



	Map<String, dynamic> toVehiculosResponse() => {
				'combustion': combustion,
				'modelo': modelo?.toVehiculosResponse(),
				'imagen': imagen,
				'transmision': transmision,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
	factory Content.fromJson(String data) {
		return Content.fromVehiculosResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
	String toJson() => json.encode(toVehiculosResponse());
}
