import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../menu/domain/models/food_model.dart';
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

  @override
  void initState() {
    counter = widget.quantity;
    super.initState();
  }
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
                Row(
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
