import 'package:restaurant_check/cart/domain/models/cart.dart';
import 'package:restaurant_check/cart/domain/models/order_model.dart';
import 'package:restaurant_check/cart/providers/order_provider.dart';

import '../../../menu/domain/models/food_model.dart';

class OrderRepository {
  final OrderProvider _orderProvider = OrderProvider();

  List<Cart> cart = [];

  List<Cart> getCart() {
    _orderProvider.getCart().then((value) {
      cart = value;
    });

    return cart;
  }

  Future<List<Order>> getOrderByOrderStatus(String orderStatus) =>
      _orderProvider.fetchUserOrder(orderStatus);

  void addToCart(Cart cart) => _orderProvider.addToCart(cart);

  Future<int> postOrder(List<Cart> foods, String address,  note,  firstName, lastName, phone) async {
    List<Food> foodList = foods
        .map((e) => Food(
              foodId: e.food.foodId,
              foodName: e.food.foodName,
              price: e.food.price,
              foodImage: e.food.foodImage,
              description: e.food.description,
              discount:  e.food.discount,
              rating: e.food.rating,
              calories: e.food.calories,
              preparationTime:  e.food.preparationTime,
              categoryId:  e.food.categoryId,
              mealId:  e.food.mealId,
            ))
        .toList();

    Order order = Order(
      orderId: 1,
      address: address,
      foods: foodList,
      orderStatus: 'Pending',
      paymentMethod: 'paymentMethod',
      userId: 1,
      date: DateTime.now().month.toString(),
      deliveryMethod: 'Shipping',
      deliveryStatus: 'Pending',
      orderDiscount: 0,
      orderNote: note,
      orderPrice: 100,
      orderTotalPrice: 100,
      orderType: 'Delivery',
      paymentStatus: 'Pending',
    );
    return await _orderProvider.postOrder(order);
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
