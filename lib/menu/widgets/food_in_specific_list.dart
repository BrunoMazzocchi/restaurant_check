import 'package:flutter/material.dart';

import '../domain/models/food_model.dart';
import '../screens/open_food.dart';

class FoodInSpecificList extends StatelessWidget {
  final Food food;

  const FoodInSpecificList({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: 400,
        height: 140,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(222, 219, 216, 1)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 100,
                  height: 100,
                  image: Image.network(food.foodImage.toString()).image),
              Row(
                children: [
                  const Icon(
                    Icons.av_timer_rounded,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    food.preparationTime.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  food.foodName.toString(),
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
                height: 60,
                child: Text(
                  food.description.toString(),
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
                  const Icon(
                    Icons.attach_money_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    food.price.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OpenFood(
                      food: food,
                    )));
      },
    );
  }
}
