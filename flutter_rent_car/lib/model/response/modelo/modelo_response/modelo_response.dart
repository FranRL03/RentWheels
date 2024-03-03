import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class ModeloResponse {
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

  ModeloResponse({
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

  factory ModeloResponse.fromModeloResponse(Map<String, dynamic> data) {
    return ModeloResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Content.fromModeloResponse(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromModeloResponse(
              data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalElements: data['totalElements'] as int?,
      totalPages: data['totalPages'] as int?,
      size: data['size'] as int?,
      number: data['number'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromModeloResponse(data['sort'] as Map<String, dynamic>),
      first: data['first'] as bool?,
      numberOfElements: data['numberOfElements'] as int?,
      empty: data['empty'] as bool?,
    );
  }

  Map<String, dynamic> toModeloResponse() => {
        'content': content?.map((e) => e.toModeloResponse()).toList(),
        'pageable': pageable?.toModeloResponse(),
        'last': last,
        'totalElements': totalElements,
        'totalPages': totalPages,
        'size': size,
        'number': number,
        'sort': sort?.toModeloResponse(),
        'first': first,
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ModeloResponse].
  factory ModeloResponse.fromJson(String data) {
    return ModeloResponse.fromModeloResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ModeloResponse] to a JSON string.
  String toJson() => json.encode(toModeloResponse());
}
