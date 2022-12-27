import 'package:flutter/material.dart';

class OrderDone extends StatefulWidget {
  final Future<int> statusCode;
  const OrderDone({Key? key, required this.statusCode}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Order Done"),
    );
  }
}
