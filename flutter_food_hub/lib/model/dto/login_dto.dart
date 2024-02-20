class LoginDto {
  String? email;
  String? password;
  String? token;

  LoginDto({this.email, this.password, this.token});

  LoginDto.fromJson(Map<String, dynamic> json) {
    email = json['username'];
    password = json['password'];
    token = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    return data;
  }
}
