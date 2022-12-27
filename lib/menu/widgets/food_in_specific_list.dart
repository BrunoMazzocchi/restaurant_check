import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/domain/bloc/order_bloc.dart';

import '../../cart/domain/models/cart.dart';
import '../domain/models/food_model.dart';
import '../screens/open_food.dart';

class FoodInSpecificList extends StatefulWidget {
  final Food food;

  const FoodInSpecificList({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodInSpecificList> createState() => _FoodInSpecificListState();
}

class _FoodInSpecificListState extends State<FoodInSpecificList> {
  late OrderBloc orderBloc = Provider.of(context, listen: false);

  int counter = 0;
  bool wantsToAdd = false;
  late Widget currentWidget;
  void operation(int value) {
    if (value == -1 && counter > 0) {
      setState(() {
        counter--;
      });
    } else if (value == 1) {
      setState(() {
        counter++;
      });
    } else {
      setState(() {
        counter = 0;
      });
    }
  }



  Widget addToBag () {
    return Row(
      children: [
        CupertinoButton(
          onPressed: () {
            operation(-1);
          },
          child: const Icon(
            CupertinoIcons.minus,
            color: Colors.black,
          ),
        ),
        Text('$counter',
          style: const TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),),
        CupertinoButton(
          onPressed: () {
            operation(1);
          },
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.black,
          ),
        ),

        const SizedBox(
          width: 10,
        ),

        CupertinoButton(
          onPressed: () {
            if(counter != 0){
              Cart cart = Cart(food: widget.food, quantity: counter);
              orderBloc.addToCart(cart);
            }
            counter = 0;
          },
          child: const Icon(
            CupertinoIcons.cart_badge_plus,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  addToBagState() {
    setState(() {
      wantsToAdd = !wantsToAdd;
    });
  }

  Widget currentAddAction () {
    return IconButton(onPressed: (){
      addToBagState();
        }, icon: const Icon(CupertinoIcons.bag_badge_plus));
  }






  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    currentWidget = wantsToAdd ? addToBag() : currentAddAction();


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
                    widget.food.price.toString(),
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
                currentWidget,
              ],
            ),
          )
        ]),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OpenFood(
                      food: widget.food,
                    )));
      },
    );
  }
}
