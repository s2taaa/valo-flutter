import 'dart:convert';

//User respone
class LoginRespone {
  LoginRespone({
    // required this.id,
    required this.username,
    // required this.password,
    required this.accessToken,
    required this.refreshToken,
  });

  // final int id;
  final String username;
  // final String password;
  final String accessToken;
  final String refreshToken;

  factory LoginRespone.fromRawJson(String str) =>
      LoginRespone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRespone.fromJson(Map<String, dynamic> json) => LoginRespone(
        // id: json["id"],
        username: json["username"],
        // password: json["password"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "username": username,
        // "password": password,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class RefreshTokenResponse {
  RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  factory RefreshTokenResponse.fromRawJson(String str) =>
      RefreshTokenResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponse(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

List<ProfileResponse> profileResponseFromJson(String str) =>
    List<ProfileResponse>.from(
        json.decode(str).map((x) => ProfileResponse.fromJson(x)));

String profileResponseToJson(List<ProfileResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileResponse {
  String id;
  String name;
  String gender;
  String dateOfBirth;
  String phone;
  String email;
  String address;
  String imgUrl;
  String status;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
    required this.email,
    required this.address,
    required this.imgUrl,
    required this.status,
  });
  factory ProfileResponse.fromRawJson(String str) =>
      ProfileResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        id: json['id'],
        name: json['name'],
        gender: json['gender'],
        dateOfBirth: json['dateOfBirth'],
        phone: json['phone'],
        email: json['email'],
        address: json['address'],
        imgUrl: json['imgUrl'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['imgUrl'] = imgUrl;
    data['status'] = status;
    return data;
  }
}