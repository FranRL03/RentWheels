import 'dart:convert';

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  factory Sort.fromAlquilerCliente(Map<String, dynamic> data) => Sort(
        empty: data['empty'] as bool?,
        sorted: data['sorted'] as bool?,
        unsorted: data['unsorted'] as bool?,
      );

  Map<String, dynamic> toAlquilerCliente() => {
        'empty': empty,
        'sorted': sorted,
        'unsorted': unsorted,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sort].
  factory Sort.fromJson(String data) {
    return Sort.fromAlquilerCliente(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sort] to a JSON string.
  String toJson() => json.encode(toAlquilerCliente());
}
