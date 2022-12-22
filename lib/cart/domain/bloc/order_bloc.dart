import 'dart:collection';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/cart/domain/repository/order_repository.dart';

import '../../../menu/domain/models/food_model.dart';
import '../models/order_model.dart';

class OrderBloc extends Bloc {
  final OrderRepository _orderRepository = OrderRepository();
  final bool cartExist = false;
  final HashMap<Food, int> cart = HashMap();

  void addToCart(Food food, int quantity) {

   if(cart.isNotEmpty) {
     cart.forEach((key, value) {
       if(key.foodName == food.foodName){
         cart.update(key, (value) => value + quantity);
       } else {
         cart.addEntries([MapEntry(food, quantity)]);
       }
     });
   } else {
      cart.addEntries([MapEntry(food, quantity)]);
    }
  }

  void removeFromCart(Food food) {
    cart.remove(food);
  }

  void clearCart() {
    cart.clear();
  }

  HashMap<Food, int> getCart() {
    return cart;
  }


  Future<List<Order>> getOrderByOrderStatus(String orderStatus) => _orderRepository.getOrderByOrderStatus(orderStatus);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
