part of "../models.dart";

class KnowladgeData {
  int? idKnowladge;
  String? thumbnail;
  String? picture;
  String? title;
  String? description;
  String? link;
  String? urlVideo;
  int? createdAt;
  int? updatedAt;

  KnowladgeData({
    this.idKnowladge, 
    this.thumbnail, 
    this.picture, 
    this.title, 
    this.description, 
    this.link, 
    this.urlVideo, 
    this.createdAt, 
    this.updatedAt});

  KnowladgeData.fromJson(Map<String, dynamic> json) {
    idKnowladge = json['id_knowladge'];
    thumbnail = json['thumbnail'];
    picture = json['picture'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    urlVideo = json['url_video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_knowladge'] = idKnowladge;
    data['thumbnail'] = thumbnail;
    data['picture'] = picture;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['url_video'] = urlVideo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
