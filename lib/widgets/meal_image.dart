import 'package:flutter/cupertino.dart';
import 'package:restaurant_check/models/meal_model.dart';

class MealImage extends StatelessWidget {
  final Meal meal;

  const MealImage({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      width: width - 40,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(223, 226, 232, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: Image.network(meal.mealImage.toString()).image,
              width: 100,
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.mealName.toString(),
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    meal.description.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ]),
    );
  }
}
