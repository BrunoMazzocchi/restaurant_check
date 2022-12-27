import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/cart/domain/bloc/order_bloc.dart';
import 'package:restaurant_check/cart/domain/models/cart.dart';
import 'package:restaurant_check/cart/widgets/in_order_food.dart';
import 'package:restaurant_check/main/widgets/navigation.dart';

import 'checkout.dart';


class MainCart extends StatefulWidget {
  const MainCart({Key? key}) : super(key: key);

  @override
  State<MainCart> createState() => _MainCartState();
}

class _MainCartState extends State<MainCart> {
  late var orderBloc = Provider.of<OrderBloc>(context, listen: false);

  late List<Cart> cart = orderBloc.getCart();

  late Widget body;

  String test = '';

  setFood() {
    setState(() {
      if (cart.isEmpty) {
        body = emptyCart();
      } else if (cart.isNotEmpty) {
        body = filledCart();
      }
    });
  }


  Widget emptyCart() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          const Text(
            'Your cart is empty',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text(
            'Add some items from the menu',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            child: const Text('Go back to menu'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Navigation(
                            index: 0,
                          )));
            },
          )
        ],
      ),
    );
  }

  Widget filledCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
              height: 450,
              width: 400,
              margin: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InOrderFood(
                        food: cart[index].food,
                        quantity: cart[index].quantity,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
              )),
          CupertinoButton.filled(
              child: const Text('Go to checkout'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Checkout()));
              })
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    setFood();
    String user = 'Tester';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      Container(
        width: width,
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xFFE5E5E5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'We are almost there $user',
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              'Just a few steps to get your order ready to go',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      body,
    ]));
  }
}
