class PostsModel {
  Image? image;
  Vedio? vedio;
  dynamic? sId;
  dynamic? title;
  dynamic? url;
  dynamic? publicId;
  dynamic? description;
  dynamic? slug;
  List<dynamic>? likes;
  dynamic? userName;
  dynamic? userId;
  dynamic? createdAt;
  dynamic? updatedAt;
  int? iV;

  PostsModel(
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

  PostsModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    vedio = json['vedio'] != null ? new Vedio.fromJson(json['vedio']) : null;
    sId = json['_id'];
    title = json['title'];
    url = json['url'];
    publicId = json['public_id'];
    description = json['description'];
    slug = json['slug'];
    likes = json['likes'].cast<dynamic>();
    userName = json['userName'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.vedio != null) {
      data['vedio'] = this.vedio!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['url'] = this.url;
    data['public_id'] = this.publicId;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['likes'] = this.likes;
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  dynamic? publicId;
  dynamic? url;

  Image({this.publicId, this.url});

  Image.fromJson(Map<dynamic, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}

class Vedio {
  dynamic? publicId;
  dynamic? url;
  dynamic? thumbnailUrl;

  Vedio({this.publicId, this.url, this.thumbnailUrl});

  Vedio.fromJson(Map<dynamic, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}
