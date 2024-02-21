import 'dart:convert';

class LoginResponse {
  String? id;
  String? username;
  String? avatar;
  List<dynamic>? roles;
  String? token;

  LoginResponse({
    this.id,
    this.username,
    this.avatar,
    this.roles,
    this.token,
  });

  factory LoginResponse.fromLoginResponse(Map<String, dynamic> data) {
    return LoginResponse(
      id: data['id'] as String?,
      username: data['username'] as String?,
      avatar: data['avatar'] as String?,
      roles: data['roles'] as List<dynamic>,
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toLoginResponse() => {
        'id': id,
        'username': username,
        'avatar': avatar,
        'roles': roles,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginResponse].
  factory LoginResponse.fromJson(String data) {
    return LoginResponse.fromLoginResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginResponse] to a JSON string.
  String toJson() => json.encode(toLoginResponse());
}
