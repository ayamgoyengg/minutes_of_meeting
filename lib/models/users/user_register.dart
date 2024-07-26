part of "../models.dart";

class UserRegister {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  String? birthday;

  UserRegister({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.birthday,
  });

  UserRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['password_confirmation'];
    phone = json['phone'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    data['phone'] = phone;
    data['birthday'] = birthday;
    return data;
  }
}
