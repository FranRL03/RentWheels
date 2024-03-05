import 'dart:convert';

class ChangePasswordResponse {
  String? id;
  String? username;
  String? avatar;
  List<String>? roles;
  dynamic createdAt;

  ChangePasswordResponse({
    this.id,
    this.username,
    this.avatar,
    this.roles,
    this.createdAt,
  });

  factory ChangePasswordResponse.fromChangePasswordResponse(
      Map<String, dynamic> data) {
    return ChangePasswordResponse(
      id: data['id'] as String?,
      username: data['username'] as String?,
      avatar: data['avatar'] as String?,
      roles: data['roles'] as List<String>?,
      createdAt: data['createdAt'] as dynamic,
    );
  }

  Map<String, dynamic> toChangePasswordResponse() => {
        'id': id,
        'username': username,
        'avatar': avatar,
        'roles': roles,
        'createdAt': createdAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChangePasswordResponse].
  factory ChangePasswordResponse.fromJson(String data) {
    return ChangePasswordResponse.fromChangePasswordResponse(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChangePasswordResponse] to a JSON string.
  String toJson() => json.encode(toChangePasswordResponse());
}
