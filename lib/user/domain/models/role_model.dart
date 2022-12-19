class Roles {
  Roles({
    required this.id,
    required  this.description,
    required   this.state,
    required    this.roleName,});

  Roles.fromJson(dynamic json) {
    id = json['id'];
    description = json['description'];
    state = json['state'];
    roleName = json['roleName'];
  }
  num? id;
  dynamic description;
  num? state;
  String? roleName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['description'] = description;
    map['state'] = state;
    map['roleName'] = roleName;
    return map;
  }

}