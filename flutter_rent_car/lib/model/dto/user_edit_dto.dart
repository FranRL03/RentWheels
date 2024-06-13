class UserEditDto {
  String? avatar;
  String? email;
  String? telefono;
  String? pin;

  UserEditDto({
    this.avatar,
    this.email,
    this.telefono,
    this.pin,
  });

  UserEditDto.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    email = json['email'];
    telefono = json['telefono'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['telefono'] = this.telefono;
    data['pin'] = this.pin;
    return data;
  }
}
