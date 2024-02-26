class UserDetailsDto{
  String? username;
  String? avatar;
  String? email;
  String? telefono;
  String? pin;

  UserDetailsDto({
    this.username,
    this.avatar,
    this.email,
    this.telefono,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['telefono'] = this.telefono;
    data['pin'] = this.pin;
    return data;
  }
}