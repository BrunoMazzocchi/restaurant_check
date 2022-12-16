import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_check/models/category_model.dart';
import 'package:restaurant_check/models/food_model.dart';

import '../../models/meal_model.dart';
import '../database/restaurant_db.dart';

class RestaurantAPIProvider {
  Future<List<Food>> fetchFood() async {
    List<Food> foodList = [];
    try {
      final response =
      await http.get(Uri.parse('http://192.168.1.5:8000/auth/signin'));

      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        if (response.statusCode == 200) {
          foodList.add(Food.fromJson(jsonDecode(response.body)[i]));
        }
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load food');
    }
    return foodList;
  }
}
