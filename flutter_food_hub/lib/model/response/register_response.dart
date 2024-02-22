import 'dart:convert';

class RegisterResponse {
  String? id;
  String? username;
  String? avatar;
  List<dynamic>? roles;
  dynamic createdAt;

  RegisterResponse({
    this.id,
    this.username,
    this.avatar,
    this.roles,
    this.createdAt,
  });

  factory RegisterResponse.fromRegisterResponse(Map<String, dynamic> data) {
    return RegisterResponse(
      id: data['id'] as String?,
      username: data['username'] as String?,
      avatar: data['avatar'] as String?,
      roles: data['roles'] as List<dynamic>?,
      createdAt: data['createdAt'] as dynamic,
    );
  }

  Map<String, dynamic> toRegisterResponse() => {
        'id': id,
        'username': username,
        'avatar': avatar,
        'roles': roles,
        'createdAt': createdAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterResponse].
  factory RegisterResponse.fromJson(String data) {
    return RegisterResponse.fromRegisterResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterResponse] to a JSON string.
  String toJson() => json.encode(toRegisterResponse());
}
