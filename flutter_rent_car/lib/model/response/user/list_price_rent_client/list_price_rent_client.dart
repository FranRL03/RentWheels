import 'dart:convert';

class ListPriceRentClient {
  double? precio;
  String? fechaCreacion;

  ListPriceRentClient({this.precio, this.fechaCreacion});

  factory ListPriceRentClient.fromNs(Map<String, dynamic> data) {
    return ListPriceRentClient(
      precio: (data['precio'] as num?)?.toDouble(),
      fechaCreacion: data['fechaCreacion'] as String?,
    );
  }

  Map<String, dynamic> toNs() => {
        'precio': precio,
        'fechaCreacion': fechaCreacion,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListPriceRentClient].
  factory ListPriceRentClient.fromJson(String data) {
    return ListPriceRentClient.fromNs(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ListPriceRentClient] to a JSON string.
  String toJson() => json.encode(toNs());
}
