import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_check/user/domain/models/device_model.dart';

import '../domain/models/jwt_model.dart';
import '../domain/models/user_model.dart';

class UserSecurityProvider {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode = 401;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> accessToken() async {
    return Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
        .accessToken!;
  }

  Future<int> expireDate() async {
    return Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
        .expiryDuration!;
  }

  Future<int> fetchUserJwt(String email, password) async {
    try {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      Device deviceInfo =
          Device(deviceId: androidInfo.id, deviceType: androidInfo.brand);

      storage.write(key: 'deviceInfo', value: jsonEncode(deviceInfo.toJson()));
      final response = await http.post(
        Uri.parse('http://192.168.1.5:8000/auth/signin'),
        body: json.encode({
          'email': email,
          'password': password,
          'deviceInfo': deviceInfo,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Jwt jwt = Jwt.fromJson(jsonDecode(response.body));
        statusCode = response.statusCode;

        storage.write(key: "jwt", value: jsonEncode(jwt.toJson()));

        print("JWT: ${await storage.read(key: 'jwt')}");

      } else if (response.statusCode == 401) {
        statusCode = response.statusCode;
        throw Exception('Wrong credentials');
      } else {
        statusCode = response.statusCode;
      }
    } catch (error, stacktrace) {
      throw Exception('Failed to load data');
    }
    return statusCode;
  }

  Future<int> logOut() async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.1.5:8000/api/users/logout'),
        body: json.encode({
          'deviceInfo': jsonDecode("${await storage.read(key: 'deviceInfo')}"),
          'token': await storage.read(
            key: 'accessToken',
          ),
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

      if (response.statusCode == 200) {
        statusCode = response.statusCode;
      }

      await storage.delete(key: 'jwt');
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load data');
    }

    return statusCode;
  }

  Future<User?> fetchUser() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/users/me'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load user data');
    }

    return null;
  }

  Future<bool> isUserLoggedIn() async {
    bool isLogged = false;
    if (Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
                .accessToken !=
            null &&
        Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
                .expiryDuration! >
            DateTime.now().millisecondsSinceEpoch) {
      final response = await http.post(
        Uri.parse('http://192.168.1.5:8000/auth/validate'),
        body: json.encode({
          'token': await accessToken(),
        }),
      );

      if (response.statusCode == 200) {
        isLogged = true;
      } else {
        isLogged = false;
      }
    } else {
      isLogged = false;
    }

    return isLogged;
  }

  Future<int> signUpUser(String email, password, name, nickname) async {
    int statusCode;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.5:8000/auth/signup'),
        body: json.encode({
          'email': email,
          'password': password,
          'role': 'ROLE_USER',
          'name': name,
          'nickname': nickname,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        return statusCode = response.statusCode;
      } else {
        statusCode = response.statusCode;
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load data');
    }
    return statusCode;
  }
}
