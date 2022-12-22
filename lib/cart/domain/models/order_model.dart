import '../../../menu/domain/models/food_model.dart';

class Order {
  Order({
    required  this.orderId,
    required this.address,
    required  this.date,
    required   this.paymentMethod,
    required    this.paymentStatus,
    required   this.deliveryMethod,
    required    this.deliveryStatus,
    required    this.orderStatus,
    required      this.orderType,
    required    this.orderNote,
    required     this.orderPrice,
    required    this.orderDiscount,
    required    this.orderTotalPrice,
    required    this.userId,
    required   this.foods,});

  Order.fromJson(dynamic json) {
    orderId = json['order_id'];
    address = json['address'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    deliveryMethod = json['delivery_method'];
    deliveryStatus = json['delivery_status'];
    orderStatus = json['order_status'];
    orderType = json['order_type'];
    orderNote = json['order_note'];
    orderPrice = json['order_price'];
    orderDiscount = json['order_discount'];
    orderTotalPrice = json['order_total_price'];
    userId = json['user_id'];
    if (json['foods'] != null) {
      foods = [];
      json['foods'].forEach((v) {
        foods?.add(Food.fromJson(v));
      });
    }
  }
  int? orderId;
  String? address;
  String? date;
  String? paymentMethod;
  String? paymentStatus;
  String? deliveryMethod;
  String? deliveryStatus;
  String? orderStatus;
  String? orderType;
  String? orderNote;
  double? orderPrice;
  double? orderDiscount;
  double? orderTotalPrice;
  int? userId;
  List<Food>? foods;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['address'] = address;
    map['date'] = date;
    map['payment_method'] = paymentMethod;
    map['payment_status'] = paymentStatus;
    map['delivery_method'] = deliveryMethod;
    map['delivery_status'] = deliveryStatus;
    map['order_status'] = orderStatus;
    map['order_type'] = orderType;
    map['order_note'] = orderNote;
    map['order_price'] = orderPrice;
    map['order_discount'] = orderDiscount;
    map['order_total_price'] = orderTotalPrice;
    map['user_id'] = userId;
    final foods = this.foods;
    if (foods != null) {
      map['foods'] = foods.map((v) => v.toJson()).toList();
    }
    return map;
  }

}