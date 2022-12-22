import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_check/cart/domain/models/order_model.dart';

import '../../user/domain/models/jwt_model.dart';

class OrderProvider {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String> accessToken() async {
    return Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
        .accessToken!;
  }

  Future<List<Order>> fetchUserOrder(String orderStatus) async {
    List<Order> orders = [];

    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/orders/user/$orderStatus'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        if (response.statusCode == 200) {
          orders.add(Order.fromJson(jsonDecode(response.body)[i]));
        }
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load user data');
    }

    return orders;
  }
}
