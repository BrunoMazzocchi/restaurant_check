import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../menu/domain/models/category_model.dart';
import '../menu/domain/models/food_model.dart';
import '../menu/domain/models/meal_model.dart';
import '../menu/domain/repository/restaurant_api_repository.dart';
import '../user/domain/models/user_model.dart';
import '../user/domain/repository/user_security_repository.dart';

class RestaurantMenuBloc implements Bloc {
  final _restaurantAPIRepository = RestaurantAPIRepository();
  final _userSecurityRepository = UserSecurityRepository();

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

  Future<int> fetchUserJwt(String email, password) {
    return _userSecurityRepository.fetchUserJwt(email, password);
  }

  Future<User?> fetchUser() {
    return _userSecurityRepository.fetchUser();
  }

  Future<int> logOutUser() {
    return _userSecurityRepository.logOutUser();
  }

  Future<int> isValid() {
    return _userSecurityRepository.isValid();
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }
}

