import 'package:flutter/material.dart';
import 'package:restaurant_check/models/food_models.dart';
import 'package:restaurant_check/views/open_food.dart';

class FoodImageTimer extends StatelessWidget {
  final Food food;

  const FoodImageTimer({
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
            color: Color.fromRGBO(223, 226, 232, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
                width: 90,
                height: 90,
                image: Image.network(food.image.toString()).image,
                fit: BoxFit.cover),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.av_timer_rounded,
                      color: Colors.grey,
                      size: 25,
                    ),
                    Text(food.time.toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  OpenFood(food: food,)));
      },
    );
  }
}
