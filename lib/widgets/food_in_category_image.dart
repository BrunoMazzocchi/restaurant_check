import 'package:flutter/material.dart';
import 'package:restaurant_check/models/food_models.dart';

import '../views/open_food.dart';

class FoodInCategoryImage extends StatelessWidget {
  final Food food;

  const FoodInCategoryImage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 300,
        height: 150,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(223, 226, 232, 1)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 100,
                  height: 100,
                  image: Image.network(food.image.toString()).image),
              Text(
                food.time.toString(),
                style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                food.name.toString(),
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 200,
                height: 80,
                child: Text(
                  food.description.toString(),
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
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
