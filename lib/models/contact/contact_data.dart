part of "../models.dart";

class ContactData {
  int? idContact;
  String? email;
  String? phone;
  String? website;
  String? wa;
  String? twitter;
  String? fb;
  String? ig;
  int? createdAt;
  int? updatedAt;

  ContactData({this.idContact, this.email, this.phone, this.website, this.wa, this.twitter, this.fb, this.ig, this.createdAt, this.updatedAt});

  ContactData.fromJson(Map<String, dynamic> json) {
    idContact = json['id_contact'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    wa = json['wa'];
    twitter = json['twitter'];
    fb = json['fb'];
    ig = json['ig'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_contact'] = idContact;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    data['wa'] = wa;
    data['twitter'] = twitter;
    data['fb'] = fb;
    data['ig'] = ig;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
