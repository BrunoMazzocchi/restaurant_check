import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_check/cart/domain/models/cart.dart';
import 'package:restaurant_check/cart/domain/models/order_model.dart';

import '../../menu/domain/models/food_model.dart';
import '../../user/domain/models/jwt_model.dart';

class OrderProvider {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<Cart> cart = [];

  Future<List<Cart>> getCart() async {
    return cart;
  }

  Future<void> addToCart(Cart cartItem) async {
    bool exist = false;
    if (cart.isNotEmpty) {
      cart
          .map((e) => {
                if (e.food.foodId == cartItem.food.foodId)
                  {e.quantity = e.quantity + cartItem.quantity, exist = true}
              })
          .toList();

      if (!exist) {
        cart.add(cartItem);
      } else {
        cart = cart;
      }
    } else if (cart.isEmpty) {
      cart.add(cartItem);
    }
  }

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

  Future<int> postOrder(Order order) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.5:8000/api/orders/add'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
        body: jsonEncode({
          "address": order.address,
          "date": order.date,
          "payment_method": order.paymentMethod,
          "payment_status": order.paymentStatus,
          "delivery_method": order.deliveryMethod,
          "delivery_status": order.deliveryStatus,
          "order_status": order.orderStatus,
          "order_type": order.orderType,
          "order_note": order.orderNote,
          "order_price": order.orderPrice,
          "order_discount": order.orderDiscount,
          "order_total_price": order.orderTotalPrice,
          "user_id": order.userId,
          "foods": order.foods,
        }),
      );

      cart.clear();

      if (response.statusCode == 200) {
        return 200;
      } else {
        return 400;
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load user data');
    }
  }

  removeFood(Food food) {
    cart.removeWhere((element) => element.food.foodId == food.foodId);
  }
}
