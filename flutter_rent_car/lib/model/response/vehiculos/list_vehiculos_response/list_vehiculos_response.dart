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

	factory ListVehiculosResponse.fromVehiculosResponse(Map<String, dynamic> data) {
		return ListVehiculosResponse(
			content: (data['content'] as List<dynamic>?)
						?.map((e) => Content.fromVehiculosResponse(e as Map<String, dynamic>))
						.toList(),
			pageable: data['pageable'] == null
						? null
						: Pageable.fromVehiculosResponse(data['pageable'] as Map<String, dynamic>),
			last: data['last'] as bool?,
			totalPages: data['totalPages'] as int?,
			totalElements: data['totalElements'] as int?,
			size: data['size'] as int?,
			number: data['number'] as int?,
			sort: data['sort'] == null
						? null
						: Sort.fromVehiculosResponse(data['sort'] as Map<String, dynamic>),
			first: data['first'] as bool?,
			numberOfElements: data['numberOfElements'] as int?,
			empty: data['empty'] as bool?,
		);
	}



	Map<String, dynamic> toVehiculosResponse() => {
				'content': content?.map((e) => e.toVehiculosResponse()).toList(),
				'pageable': pageable?.toVehiculosResponse(),
				'last': last,
				'totalPages': totalPages,
				'totalElements': totalElements,
				'size': size,
				'number': number,
				'sort': sort?.toVehiculosResponse(),
				'first': first,
				'numberOfElements': numberOfElements,
				'empty': empty,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListVehiculosResponse].
	factory ListVehiculosResponse.fromJson(String data) {
		return ListVehiculosResponse.fromVehiculosResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ListVehiculosResponse] to a JSON string.
	String toJson() => json.encode(toVehiculosResponse());
}
