part of "../models.dart";

class UserEditPhoto {
  dynamic profilePhotoPath;

  UserEditPhoto({
    this.profilePhotoPath,
  });

  UserEditPhoto.fromJson(Map<String, dynamic> json) {
    profilePhotoPath = json['profile_photo_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_photo_path'] = profilePhotoPath;
    return data;
  }

  Map<String, dynamic> toJsonSend(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['profile_photo_path'] = profilePhotoPath;
    return data;
  }
}
