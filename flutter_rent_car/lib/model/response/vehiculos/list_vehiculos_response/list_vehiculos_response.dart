import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class ListVehiculosResponse {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  ListVehiculosResponse({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  factory ListVehiculosResponse.fromVehiculoResponse(Map<String, dynamic> data) {
    return ListVehiculosResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Content.fromVehiculoResponse(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromVehiculoResponse(
              data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalPages: data['totalPages'] as int?,
      totalElements: data['totalElements'] as int?,
      size: data['size'] as int?,
      number: data['number'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromVehiculoResponse(data['sort'] as Map<String, dynamic>),
      first: data['first'] as bool?,
      numberOfElements: data['numberOfElements'] as int?,
      empty: data['empty'] as bool?,
    );
  }

  Map<String, dynamic> toVehiculoResponse() => {
        'content': content?.map((e) => e.toVehiculoResponse()).toList(),
        'pageable': pageable?.toVehiculoResponse(),
        'last': last,
        'totalPages': totalPages,
        'totalElements': totalElements,
        'size': size,
        'number': number,
        'sort': sort?.toVehiculoResponse(),
        'first': first,
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListVehiculoResponse].
  factory ListVehiculosResponse.fromJson(String data) {
    return ListVehiculosResponse.fromVehiculoResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ListVehiculoResponse] to a JSON string.
  String toJson() => json.encode(toVehiculoResponse());
}
