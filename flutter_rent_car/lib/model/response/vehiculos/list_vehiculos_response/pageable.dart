import 'dart:convert';

import 'sort.dart';

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? unpaged;
  bool? paged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.unpaged,
    this.paged,
  });

  factory Pageable.fromListVehiculos(Map<String, dynamic> data) => Pageable(
        pageNumber: data['pageNumber'] as int?,
        pageSize: data['pageSize'] as int?,
        sort: data['sort'] == null
            ? null
            : Sort.fromListVehiculos(data['sort'] as Map<String, dynamic>),
        offset: data['offset'] as int?,
        unpaged: data['unpaged'] as bool?,
        paged: data['paged'] as bool?,
      );

  Map<String, dynamic> toListVehiculos() => {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'sort': sort?.toListVehiculos(),
        'offset': offset,
        'unpaged': unpaged,
        'paged': paged,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pageable].
  factory Pageable.fromJson(String data) {
    return Pageable.fromListVehiculos(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pageable] to a JSON string.
  String toJson() => json.encode(toListVehiculos());
}
