import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../models/category_model.dart';
import '../models/food_model.dart';
import '../models/meal_model.dart';
import '../resources/repository/restaurant_api_repository.dart';

class RestaurantMenuBloc implements Bloc {

  final _restaurantAPIRepository = RestaurantAPIRepository();

  Future<List<Food>> fetchFood() {
    print('hola');
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
    // TODO: implement dispose
  }

}