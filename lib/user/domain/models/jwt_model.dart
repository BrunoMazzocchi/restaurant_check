class Jwt {
  Jwt({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiryDuration,
  });

  Jwt.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    tokenType = json['tokenType'];
    expiryDuration = json['expiryDuration'];
  }

  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiryDuration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['tokenType'] = tokenType;
    map['expiryDuration'] = expiryDuration;
    return map;
  }
}
