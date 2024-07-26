part of "../models.dart";

class UserEditProfile {
  String? name;
  String? email;
  String? phone;
  String? birthday;

  UserEditProfile({
    this.name,
    this.email,
    this.phone,
    this.birthday,
  });

  UserEditProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['birthday'] = birthday;
    return data;
  }
}
