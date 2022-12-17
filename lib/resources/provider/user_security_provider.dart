import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_check/models/jwt_model.dart';

class UserSecurityProvider {

  FlutterSecureStorage storage = const FlutterSecureStorage();
  int statusCode = 401;
  Future<int> fetchUserJwt(String email, password) async {

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.5:8000/auth/signin'),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Jwt jwt = Jwt.fromJson(jsonDecode(response.body));
        await storage.write(key: 'jwt', value: jwt.accessToken);
        await storage.write(key: 'refreshToken', value: jwt.refreshToken);
        await storage.write(key: 'tokenType', value: jwt.tokenType);
        await storage.write(key: 'expiryDuration', value: jwt.expiryDuration.toString());

        statusCode = response.statusCode;
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load data');
    }

    return statusCode;
  }
}
