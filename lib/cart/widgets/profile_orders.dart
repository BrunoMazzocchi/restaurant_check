import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'completed_order_list.dart';

class ProfileOrders extends StatelessWidget {
  const ProfileOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SizedBox(
          child: Column(
        children: [
          const Text(
            "Active orders",
            style: TextStyle(
              fontFamily: "SF Pro",
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.55,
            child: const CompletedOrder(),
          ),
        ],
      )),
    );
  }
}
