part of "../models.dart";

class UserData {
  int? id;
  String? name;
  String? token;
  String? personGroup;
  String? employeeId;
  String? email;
  String? emailVerifiedAt; // Assuming this can be a String, otherwise it can be DateTime or another type
  String? twoFactorConfirmedAt; // Same assumption as above
  int? currentTeamId;
  dynamic profilePhotoPath;
  String? phone;
  String? roles;
  int? createdAt;
  int? updatedAt;
  String? profilePhotoUrl;

  UserData({
    this.id,
    this.name,
    this.token,
    this.personGroup,
    this.employeeId,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.phone,
    this.roles,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    personGroup = json['person_group'];
    employeeId = json['employee_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'] is String 
        ? int.tryParse(json['current_team_id']) 
        : json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    phone = json['phone'];
    roles = json['roles'];
    createdAt = json['created_at'] is String 
        ? int.tryParse(json['created_at']) 
        : json['created_at'];
    updatedAt = json['updated_at'] is String 
        ? int.tryParse(json['updated_at']) 
        : json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['name'] = name;
    data['person_group'] = personGroup;
    data['employee_id'] = employeeId;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    data['current_team_id'] = currentTeamId;
    data['profile_photo_path'] = profilePhotoPath;
    data['phone'] = phone;
    data['roles'] = roles;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    // Include the profile photo path
    data['profile_photo_path'] = profilePhotoPath;
    return data;
  }

}
