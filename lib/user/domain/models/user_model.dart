import 'role_model.dart';

class User {
  User({
   required   this.userId,
    required    this.name,
    required   this.nickname,
    required   this.email,
    required    this.password,
    required    this.phone,
    required    this.image,
    required    this.createdAt,
    required    this.active,
    required    this.roles,});

  User.fromJson(dynamic json) {
    userId = json['userId'];
    name = json['name'];
    nickname = json['nickname'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    createdAt = json['created_at'];
    active = json['active'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }
  num? userId;
  String? name;
  String? nickname;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? createdAt;
  bool? active;
  List<Roles>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['name'] = name;
    map['nickname'] = nickname;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['active'] = active;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}