class RegisterModel {
  State? state;
  ImgData? imgData;

  RegisterModel({this.state, this.imgData});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    imgData =
        json['imgData'] != null ? new ImgData.fromJson(json['imgData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.imgData != null) {
      data['imgData'] = this.imgData!.toJson();
    }
    return data;
  }
}

class State {
  String? name;
  String? isTeacher;
  String? email;
  String? phone;
  String? password;
  String? cpassword;
  String? rollno;

  State(
      {this.name,
      this.isTeacher,
      this.email,
      this.phone,
      this.password,
      this.cpassword,
      this.rollno});

  State.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isTeacher = json['isTeacher'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    cpassword = json['cpassword'];
    rollno = json['rollno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isTeacher'] = this.isTeacher;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    data['rollno'] = this.rollno;
    return data;
  }
}

class ImgData {
  String? url;
  String? publicId;

  ImgData({this.url, this.publicId});

  ImgData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['public_id'] = this.publicId;
    return data;
  }
}
