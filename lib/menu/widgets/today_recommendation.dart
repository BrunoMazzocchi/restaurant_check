import 'package:flutter/material.dart';
import 'package:restaurant_check/menu/screens/open_food.dart';

import '../domain/models/food_model.dart';

class TodayRecommendation extends StatelessWidget {
  final Food food;

  const TodayRecommendation({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 140,
        height: 140,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(222, 219, 216, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              width: 90,
              height: 90,
              image: Image.network(food.foodImage.toString()).image,
              fit: BoxFit.cover,
            ),
          ],
        ),
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
