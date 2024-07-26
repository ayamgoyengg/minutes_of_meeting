part of "../models.dart";

class UserEditPassword {
  String? email;
  String? password;
  String? passwordConfirmation;
  String? oldPassword;

  UserEditPassword({this.email, this.password, this.passwordConfirmation, this.oldPassword});

  UserEditPassword.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    oldPassword = json['old_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['old_password'] = oldPassword;
    return data;
  }
}
