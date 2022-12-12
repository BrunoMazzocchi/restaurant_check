import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food_model.dart';


class OpenFood extends StatelessWidget {
  final Food food;

  const OpenFood({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: 350,
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
                    image: Image.network(food.foodImage.toString()).image,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  width: 500,
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        food.foodName.toString(),
                        style: const TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
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
                            food.calories.toString(),
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
                                food.price.toString(),
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
                            food.preparationTime.toString(),
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
                          children: [
                            Text(
                              food.description.toString(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoButton.filled(
                      onPressed: () {},
                      child: const Text('Add to cart'),
                    ),
                    Row(
                      children: [
                        CupertinoButton(
                          onPressed: () {},
                          child: const Icon(
                            CupertinoIcons.minus,
                            color: Colors.black,
                          ),
                        ),
                        const Text('1'),
                        CupertinoButton(
                          onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
