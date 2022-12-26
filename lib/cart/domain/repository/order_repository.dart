import 'dart:collection';

import 'package:restaurant_check/cart/domain/models/cart.dart';
import 'package:restaurant_check/cart/domain/models/order_model.dart';
import 'package:restaurant_check/cart/providers/order_provider.dart';

import '../../../menu/domain/models/food_model.dart';


class OrderRepository {

  final OrderProvider _orderProvider = OrderProvider();

  List<Cart> cart = [];
  List<Cart> getCart()  {
     _orderProvider.getCart().then((value) {
       cart = value;
     });

     return cart;
  }

  Future<List<Order>> getOrderByOrderStatus(String orderStatus) => _orderProvider.fetchUserOrder(orderStatus);


  void addToCart(Cart cart)=>_orderProvider.addToCart(cart);



  Future<Order> updateOrder(Order order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  Future<Order> deleteOrder(Order order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }
}
