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

	factory Pageable.fromVehiculosResponse(Map<String, dynamic> data) {
		return Pageable(
			pageNumber: data['pageNumber'] as int?,
			pageSize: data['pageSize'] as int?,
			sort: data['sort'] == null
						? null
						: Sort.fromVehiculosResponse(data['sort'] as Map<String, dynamic>),
			offset: data['offset'] as int?,
			unpaged: data['unpaged'] as bool?,
			paged: data['paged'] as bool?,
		);
	}



	Map<String, dynamic> toVehiculosResponse() => {
				'pageNumber': pageNumber,
				'pageSize': pageSize,
				'sort': sort?.toVehiculosResponse(),
				'offset': offset,
				'unpaged': unpaged,
				'paged': paged,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pageable].
	factory Pageable.fromJson(String data) {
		return Pageable.fromVehiculosResponse(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Pageable] to a JSON string.
	String toJson() => json.encode(toVehiculosResponse());
}
