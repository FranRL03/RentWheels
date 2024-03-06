import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class AlquilerClientesResponse {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  bool? first;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? empty;

  AlquilerClientesResponse({
    this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.first,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.empty,
  });

  factory AlquilerClientesResponse.fromAlquilerCliente(
      Map<String, dynamic> data) {
    return AlquilerClientesResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Content.fromAlquilerCliente(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromAlquilerCliente(
              data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalElements: data['totalElements'] as int?,
      totalPages: data['totalPages'] as int?,
      first: data['first'] as bool?,
      size: data['size'] as int?,
      number: data['number'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromAlquilerCliente(data['sort'] as Map<String, dynamic>),
      numberOfElements: data['numberOfElements'] as int?,
      empty: data['empty'] as bool?,
    );
  }

  Map<String, dynamic> toAlquilerCliente() => {
        'content': content?.map((e) => e.toAlquilerCliente()).toList(),
        'pageable': pageable?.toAlquilerCliente(),
        'last': last,
        'totalElements': totalElements,
        'totalPages': totalPages,
        'first': first,
        'size': size,
        'number': number,
        'sort': sort?.toAlquilerCliente(),
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AlquilerClientes].
  factory AlquilerClientesResponse.fromJson(String data) {
    return AlquilerClientesResponse.fromAlquilerCliente(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AlquilerClientes] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
