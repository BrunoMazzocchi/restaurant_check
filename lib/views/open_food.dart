import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/views/settings.dart';

import '../models/food_model.dart';

class OpenFood extends StatefulWidget {
  final Food food;

  const OpenFood({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<OpenFood> createState() => _OpenFoodState();
}

class _OpenFoodState extends State<OpenFood> {
  int counter = 0;

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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 10),
                  width: 500,
                  height: 340,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(223, 226, 232, 1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image(
                    image:
                        Image.network(widget.food.foodImage.toString()).image,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  width: width,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Text(
                          widget.food.foodName.toString(),
                          style: const TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(223, 226, 232, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Calories',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            widget.food.calories.toString(),
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(223, 226, 232, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '\$ ',
                                style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                widget.food.price.toString(),
                                style: const TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(223, 226, 232, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Time',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            widget.food.preparationTime.toString(),
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 350,
                        height: 200,
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            Text(
                              widget.food.description.toString(),
                              style: const TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()));
                  },
                  child: const Text('Add to cart'),
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
                    Text('$counter'),
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
            )
          ],
        ),
      ),
    );
  }
}
