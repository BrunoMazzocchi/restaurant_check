import 'package:restaurant_check/menu/domain/models/category_model.dart';

import '../../providers/restaurant_api_provider.dart';
import '../models/food_model.dart';
import '../models/meal_model.dart';


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