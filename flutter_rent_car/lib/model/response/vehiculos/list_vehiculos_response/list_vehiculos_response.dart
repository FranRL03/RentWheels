import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class ListVehiculosResponse {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
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
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  factory ListVehiculosResponse.fromListVehiculos(Map<String, dynamic> data) {
    return ListVehiculosResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Content.fromListVehiculos(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromListVehiculos(
              data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalElements: data['totalElements'] as int?,
      totalPages: data['totalPages'] as int?,
      size: data['size'] as int?,
      number: data['number'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromListVehiculos(data['sort'] as Map<String, dynamic>),
      first: data['first'] as bool?,
      numberOfElements: data['numberOfElements'] as int?,
      empty: data['empty'] as bool?,
    );
  }

  Map<String, dynamic> toListVehiculos() => {
        'content': content?.map((e) => e.toListVehiculos()).toList(),
        'pageable': pageable?.toListVehiculos(),
        'last': last,
        'totalElements': totalElements,
        'totalPages': totalPages,
        'size': size,
        'number': number,
        'sort': sort?.toListVehiculos(),
        'first': first,
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListVehiculosResponse].
  factory ListVehiculosResponse.fromJson(String data) {
    return ListVehiculosResponse.fromListVehiculos(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ListVehiculosResponse] to a JSON string.
  String toJson() => json.encode(toListVehiculos());
}
