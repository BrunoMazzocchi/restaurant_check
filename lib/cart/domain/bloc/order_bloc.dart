import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/cart/domain/repository/order_repository.dart';

import '../../../menu/domain/models/food_model.dart';
import '../models/cart.dart';
import '../models/order_model.dart';

class OrderBloc extends Bloc {
  final OrderRepository _orderRepository = OrderRepository();
  final bool cartExist = false;
  List<Cart> cart = [];

  addToCart(Cart item) {
    _orderRepository.addToCart(item);
  }

  List<Cart> getCart() {
    return _orderRepository.getCart();
  }

  Future<List<Order>> getOrderByOrderStatus(String orderStatus) =>
      _orderRepository.getOrderByOrderStatus(orderStatus);

  Future<int> postOrder(List<Cart> foods, String address,  note,  firstName,  lastName,  phone) =>
      _orderRepository.postOrder(
        foods,
        address,
        note,
        firstName,
        lastName,
        phone
      );

  removeFood(Food food) {
    _orderRepository.removeFood(food);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
