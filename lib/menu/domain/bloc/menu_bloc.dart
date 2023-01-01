import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/menu/domain/repository/restaurant_api_repository.dart';
import 'package:restaurant_check/user/domain/repository/user_security_repository.dart';

import '../models/category_model.dart';
import '../models/food_model.dart';
import '../models/meal_model.dart';

class MenuBloc extends Bloc {
  final RestaurantAPIRepository _restaurantAPIRepository = RestaurantAPIRepository();


  Future<List<Food>> fetchFood() {
    return _restaurantAPIRepository.fetchFood();
  }

  Future<List<Food>> fetchFoodByCategoryId(int categoryId) {
    return _restaurantAPIRepository.fetchFoodByCategoryId(categoryId);
  }

  Future<List<Food>> fetchFoodByMealId(int mealId) {
    return _restaurantAPIRepository.fetchFoodByMealId(mealId);
  }

  Future<List<Category>> fetchCategory() {
    return _restaurantAPIRepository.fetchFoodByCategory();
  }

  Future<List<Meal>> fetchMeal() {
    return _restaurantAPIRepository.fetchMeal();
  }
  @override
  void dispose() {
  }
}