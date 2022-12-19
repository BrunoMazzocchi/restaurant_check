import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_check/menu/domain/models/category_model.dart';

import '../../user/domain/models/jwt_model.dart';
import '../domain/models/food_model.dart';
import '../domain/models/meal_model.dart';

class RestaurantAPIProvider {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String> accessToken() async {
    return Jwt.fromJson(jsonDecode("${await storage.read(key: 'jwt')}"))
        .accessToken!;
  }

  Future<List<Food>> fetchFood() async {
    List<Food> foodList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/food/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

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

  Future<List<Food>> fetchFoodByCategoryId(int categoryId) async {
    List<Food> foodList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/food/byCategory/$categoryId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

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

  Future<List<Food>> fetchFoodByMealId(int mealId) async {
    List<Food> foodList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/food/byMeal/$mealId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

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

  Future<List<Category>> fetchCategory() async {
    List<Category> categoryList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/category/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        if (response.statusCode == 200) {
          categoryList.add(Category.fromJson(jsonDecode(response.body)[i]));
        }
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load category');
    }
    return categoryList;
  }

  Future<List<Meal>> fetchMeal() async {
    List<Meal> mealList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5:8000/api/meal/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await accessToken()}',
        },
      );

      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        if (response.statusCode == 200) {
          mealList.add(Meal.fromJson(jsonDecode(response.body)[i]));
        }
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load meal');
    }
    return mealList;
  }
}
