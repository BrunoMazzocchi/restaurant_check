import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../menu/domain/models/food_model.dart';
import '../domain/bloc/order_bloc.dart';
import '../domain/models/cart.dart';



class InOrderFood extends StatefulWidget {
  final Food food;
  final int quantity;
  const InOrderFood({
    Key? key,
    required this.food, required this.quantity,
  }) : super(key: key);

  @override
  State<InOrderFood> createState() => _InOrderFoodState();
}

class _InOrderFoodState extends State<InOrderFood> {
  late int counter;
  late double totalPrice;
  late OrderBloc orderBloc;


  @override
  void initState() {
    counter = widget.quantity;
    totalPrice = widget.food.price! * counter;

    orderBloc = Provider.of<OrderBloc>(context, listen: false);

    super.initState();
  }


  removeFood() {
    setState(() {
      orderBloc.removeFood(widget.food);
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(

        margin: const EdgeInsets.only(bottom: 20),
        width: width,
        height: 140,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(222, 219, 216, 1)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 100,
                  height: 100,
                  image: Image.network(widget.food.foodImage.toString()).image),
              Row(
                children: [
                  const Icon(
                    Icons.attach_money_sharp,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text(
                    totalPrice.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.food.foodName.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: Text(
                    widget.food.description.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(

                  children: [

                    CupertinoButton(child: const Icon(CupertinoIcons.delete_solid,
                    color: Colors.grey,), onPressed: () {
                      removeFood();
                    }),

                  ],
                )
              ],
            ),
          )
        ]),
      ),
      onTap: () {
      },
    );
  }
}
