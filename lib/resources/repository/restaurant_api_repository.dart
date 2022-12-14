import 'package:restaurant_check/models/category_model.dart';
import 'package:restaurant_check/models/food_model.dart';
import 'package:restaurant_check/resources/provider/restaurant_api_provider.dart';

import '../../models/meal_model.dart';

class RestaurantAPIRepository {
  final _provider = RestaurantAPIProvider();

  Future<List<Food>> fetchFood() {
    return _provider.fetchFood();
  }

  Future<List<Food>> fetchFoodByCategoryId(int categoryId) {
    return _provider.fetchFoodByCategoryId(categoryId);
  }

  Future<List<Food>> fetchFoodByMealId(int mealId) {
    return _provider.fetchFoodByMealId(mealId);
  }


  Future<List<Category>> fetchFoodByCategory() {
    return _provider.fetchCategory();
  }

  Future<List<Meal>> fetchMeal() {
    return _provider.fetchMeal();
  }
}