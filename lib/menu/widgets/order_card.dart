import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cart/domain/models/order_model.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Order #${widget.order.orderId}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'SF Pro',
                          color: Colors.black),
                    ),
                  ],
                ),
                const Text(
                  'Ship to:',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      fontFamily: 'SF Pro',
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "${widget.order.address}",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        color: Colors.blueGrey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Status: ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "${widget.order.orderStatus}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'SF Pro',
                        color: Colors.green),
                  ),
                ],
              ),
              Text(
                'Total: \$${widget.order.orderTotalPrice}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'SF Pro',
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
