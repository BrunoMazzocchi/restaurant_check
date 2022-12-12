import 'package:flutter/material.dart';
import '../models/food_model.dart';
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
        width: 400,
        height: 140,
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
                  Text(food.preparationTime.toString(),
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45,
                  ),)
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                food.foodName.toString(),
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.bold,
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
                  maxLines: 4,
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
