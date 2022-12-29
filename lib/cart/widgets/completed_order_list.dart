import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/menu/widgets/order_card.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/bloc/order_bloc.dart';
import '../domain/models/order_model.dart';

class CompletedOrder extends StatefulWidget {
  final String status;
  const CompletedOrder({Key? key, required this.status}) : super(key: key);

  @override
  State<CompletedOrder> createState() => _CompletedOrderState();
}

class _CompletedOrderState extends State<CompletedOrder> {
  late Future<List<Order>> userOrders =
      Provider.of<OrderBloc>(context, listen: false)
          .getOrderByOrderStatus(widget.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FutureBuilder(
        future: userOrders,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Shimmer(
                gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
                child: Text("empty"),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: snapshot.data![index]);
                  },
                );
              }
              break;
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
