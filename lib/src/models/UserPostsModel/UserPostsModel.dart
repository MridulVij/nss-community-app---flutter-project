class UserPostsModel {
  List<Data>? data;

  UserPostsModel({this.data});

  UserPostsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Image? image;
  Vedio? vedio;
  String? sId;
  String? title;
  String? url;
  String? publicId;
  String? description;
  String? slug;
  List<String>? likes;
  String? userName;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.image,
      this.vedio,
      this.sId,
      this.title,
      this.url,
      this.publicId,
      this.description,
      this.slug,
      this.likes,
      this.userName,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    vedio = json['vedio'] != null ? Vedio.fromJson(json['vedio']) : null;
    sId = json['_id'];
    title = json['title'];
    url = json['url'];
    publicId = json['public_id'];
    description = json['description'];
    slug = json['slug'];
    likes = json['likes'].cast<String>();
    userName = json['userName'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (vedio != null) {
      data['vedio'] = vedio!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['url'] = url;
    data['public_id'] = publicId;
    data['description'] = description;
    data['slug'] = slug;
    data['likes'] = likes;
    data['userName'] = userName;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Image {
  String? publicId;
  String? url;

  Image({this.publicId, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['public_id'] = publicId;
    data['url'] = url;
    return data;
  }
}

class Vedio {
  String? publicId;
  String? url;
  String? thumbnailUrl;

  Vedio({this.publicId, this.url, this.thumbnailUrl});

  Vedio.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['public_id'] = publicId;
    data['url'] = url;
    data['thumbnail_url'] = thumbnailUrl;
    return data;
  }
}
