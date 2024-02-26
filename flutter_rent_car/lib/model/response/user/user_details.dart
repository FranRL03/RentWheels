import 'dart:convert';

class UserDetails {
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? telefono;
  String? pin;

  UserDetails({
    this.id,
    this.username,
    this.avatar,
    this.email,
    this.telefono,
    this.pin,
  });

  factory UserDetails.fromUserDetails(Map<String, dynamic> data) {
    return UserDetails(
      id: data['id'] as String?,
      username: data['username'] as String?,
      avatar: data['avatar'] as String?,
      email: data['email'] as String?,
      telefono: data['telefono'] as String?,
      pin: data['pin'] as String?,
    );
  }

  Map<String, dynamic> toUserDetails() => {
        'id': id,
        'username': username,
        'avatar': avatar,
        'email': email,
        'telefono': telefono,
        'pin': pin,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDetails].
  factory UserDetails.fromJson(String data) {
    return UserDetails.fromUserDetails(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDetails] to a JSON string.
  String toJson() => json.encode(toUserDetails());
}
