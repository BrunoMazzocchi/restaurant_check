import 'package:flutter/material.dart';
import 'package:restaurant_check/menu/screens/meal_food.dart';

import '../domain/models/meal_model.dart';

class FoodMealCard extends StatelessWidget {
  final Meal meal;

  const FoodMealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        width: width - 40,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(222, 219, 216, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image(
            image: Image.network(meal.mealImage.toString()).image,
            width: 80,
            height: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  meal.mealName.toString(),
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
                child: Text(
                  meal.description.toString(),
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ]),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealFood(
                      meal: meal,
                    )));
      },
    );
  }
}
