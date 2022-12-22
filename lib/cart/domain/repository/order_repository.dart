import 'package:restaurant_check/cart/domain/models/order_model.dart';
import 'package:restaurant_check/cart/providers/order_provider.dart';


class OrderRepository {

  final OrderProvider _orderProvider = OrderProvider();

  Future<Order> getOrder(String id) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  Future<List<Order>> getOrderByOrderStatus(String orderStatus) => _orderProvider.fetchUserOrder(orderStatus);

  Future<Order> createOrder(Order order) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  Future<Order> updateOrder(Order order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  Future<Order> deleteOrder(Order order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }
}
