import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/cart/widgets/completed_order_list.dart';

class ProfileOrders extends StatelessWidget {
  const ProfileOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SizedBox(
        width: width,
        height: height * 0.55,
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(tabs: [
                  Text(
                    'Active orders',
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Completed orders',
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: Flex(direction: Axis.vertical, children: [
                      Expanded(
                          child: TabBarView(children: [
                        SizedBox(
                          height: height * 0.50,
                          child: const CompletedOrder(
                            status: 'Active',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.50,
                          child: const CompletedOrder(
                            status: 'Completed',
                          ),
                        ),
                      ])),
                    ])),
              ],
            )),
      ),
    );
  }
}
