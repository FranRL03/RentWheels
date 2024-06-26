import 'dart:convert';

import 'sort.dart';

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromAlquilerCliente(Map<String, dynamic> data) {
    return Pageable(
      pageNumber: data['pageNumber'] as int?,
      pageSize: data['pageSize'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromAlquilerCliente(data['sort'] as Map<String, dynamic>),
      offset: data['offset'] as int?,
      paged: data['paged'] as bool?,
      unpaged: data['unpaged'] as bool?,
    );
  }

  Map<String, dynamic> toAlquilerCliente() => {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'sort': sort?.toAlquilerCliente(),
        'offset': offset,
        'paged': paged,
        'unpaged': unpaged,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pageable].
  factory Pageable.fromJson(String data) {
    return Pageable.fromAlquilerCliente(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pageable] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
