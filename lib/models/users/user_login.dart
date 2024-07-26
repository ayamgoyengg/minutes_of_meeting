part of "../models.dart";

class UserLogin {
  String? email;
  String? password;

  UserLogin({
    this.email,
    this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(email: json['email'] as String?, password: json['password'] as String?);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  String toString() {
    return "$email $password";
  }
}
