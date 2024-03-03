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

  factory Pageable.fromModeloResponse(Map<String, dynamic> data) => Pageable(
        pageNumber: data['pageNumber'] as int?,
        pageSize: data['pageSize'] as int?,
        sort: data['sort'] == null
            ? null
            : Sort.fromModeloResponse(data['sort'] as Map<String, dynamic>),
        offset: data['offset'] as int?,
        paged: data['paged'] as bool?,
        unpaged: data['unpaged'] as bool?,
      );

  Map<String, dynamic> toModeloResponse() => {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'sort': sort?.toModeloResponse(),
        'offset': offset,
        'paged': paged,
        'unpaged': unpaged,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pageable].
  factory Pageable.fromJson(String data) {
    return Pageable.fromModeloResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pageable] to a JSON string.
  String toJson() => json.encode(toModeloResponse());
}
