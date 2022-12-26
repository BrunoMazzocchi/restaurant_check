import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/cart/domain/repository/order_repository.dart';

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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
