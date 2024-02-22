class RegisterDto {
  String? username;
  String? nombre;
  String? email;
  String? password;
  String? verifyPassword;

  RegisterDto(
      {this.username,
      this.nombre,
      this.email,
      this.password,
      this.verifyPassword});

  RegisterDto.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    nombre = json['nombre'];
    email = json['email'];
    password = json['password'];
    verifyPassword = json['verifyPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['nombre'] = this.nombre;
    data['email'] = this.email;
    data['password'] = this.password;
    data['verifyPassword'] = this.verifyPassword;
    return data;
  }
}
