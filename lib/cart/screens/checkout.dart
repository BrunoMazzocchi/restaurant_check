import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/cart/domain/models/order_model.dart';
import 'package:restaurant_check/cart/screens/order_done.dart';

import '../domain/bloc/order_bloc.dart';
import '../domain/models/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with TickerProviderStateMixin {
  late List<Cart> cart;
  late TabController tabController;
  late OrderBloc orderBloc;
  late Order order;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    orderBloc = Provider.of<OrderBloc>(context, listen: false);
    cart = orderBloc.getCart();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Shipping',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Payment',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Review',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'Checkout your order',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'First name',
                          ),
                          controller: _nameController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Last name',
                          ),
                          controller: _lastNameController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Address',
                          ),
                          controller: _addressController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Note',
                          ),
                          controller: _noteController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                          ),
                          controller: _phoneController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CupertinoButton.filled(
                    child: const Text(
                      'Continue',
                    ),
                    onPressed: () {
                      tabController.animateTo(1);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: width,
              height: height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Payment method',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            CupertinoIcons.creditcard,
                            size: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Credit card',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(
                            CupertinoIcons.money_dollar_circle,
                            size: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Cash',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CupertinoButton.filled(
                    child: const Text(
                      'Continue',
                    ),
                    onPressed: () {
                      tabController.animateTo(1);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Review your order',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            "${cart[index].food.foodImage}",
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            "${cart[index].food.foodName}",
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            '\$${cart[index].food.price}',
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Text(
                            '${cart[index].quantity}',
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  CupertinoButton.filled(
                    child: const Text(
                      'Place order',
                    ),
                    onPressed: () {
                      Future<int> statusCode = orderBloc.postOrder(
                        cart,
                        _addressController.text,
                        _noteController.text,
                        _nameController.text,
                        _lastNameController.text,
                        _phoneController.text,
                      );
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDone(statusCode: statusCode,),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
