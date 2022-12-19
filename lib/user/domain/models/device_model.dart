class Device {
  Device({
    required this.deviceId,
    required this.deviceType,
  });

  Device.fromJson(dynamic json) {
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
  }

  String? deviceId;
  String? deviceType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceId'] = deviceId;
    map['deviceType'] = deviceType;
    return map;
  }
}
