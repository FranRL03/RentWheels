class UserDetailsDto{
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? telefono;
  String? pin;

  UserDetailsDto({
    this.id,
    this.username,
    this.avatar,
    this.email,
    this.telefono,
    this.pin,
  });

  UserDetailsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username =  json['username'];
    avatar = json['avatar'];
    email = json['email'];
    telefono = json['telefono'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['telefono'] = this.telefono;
    data['pin'] = this.pin;
    return data;
  }
}