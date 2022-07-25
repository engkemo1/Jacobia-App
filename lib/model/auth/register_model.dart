class RegisterModel {
  String? code;
  String? message;
  Data? data;

  RegisterModel({this.code, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class User {
  String? role;
  String? bio;
  String? birthDay;
  String? city;
  String? country;
  String? gender;
  String? imageUrl;
  int? userId;
  String? email;
  String? firstName;
  String? secondName;
  String? phone;
  String? updatedAt;
  String? createdAt;

  User(
      {this.role,
        this.bio,
        this.birthDay,
        this.city,
        this.country,
        this.gender,
        this.imageUrl,
        this.userId,
        this.email,
        this.firstName,
        this.secondName,
        this.phone,
        this.updatedAt,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    bio = json['bio'];
    birthDay = json['birthDay'];
    city = json['city'];
    country = json['country'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    email = json['email'];
    firstName = json['firstname'];
    secondName = json['lastname'];
    phone = json['phone'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['bio'] = bio;
    data['birthDay'] = birthDay;
    data['city'] = city;
    data['country'] = country;
    data['gender'] = gender;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    data['email'] = email;
    data['firstname'] = firstName;
    data['lastname'] = secondName;
    data['phone'] = phone;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
