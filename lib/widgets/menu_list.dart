import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/widgets/meal_image.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Separated in meals',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Container(
            height: 245,
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                MealImage(
                    networkImage:
                        'https://wimpy.co.za/site/images/pages/menu/2021/breakfast/brekkie/lekker-breakfast-generic-(400px-x-300px).png',
                    mealName: 'Breakfast',
                    mealDescription:
                        'The best for breakfast. Available from 7 AM to 11 AM.'),
                SizedBox(
                  height: 20,
                ),
                MealImage(
                    networkImage:
                    'https://drqs.pk/images/09353f3ee36562551808269abaabe1d0_1619409733.png',
                    mealName: 'Lunch',
                    mealDescription:
                    'The best for the best. Available from 11 AM to closing.'),
                SizedBox( height: 20,),
                MealImage(
                    networkImage:
                    'https://www.grisspasta.com/image.png?v=fca8addf74e68655ceeb7a2a',
                    mealName: 'Dinner',
                    mealDescription:
                    'Sleep well, with the best meal. Available from 5 PM to closing.'),
                SizedBox( height: 20,),
                MealImage(
                    networkImage:
                    'https://images.squarespace-cdn.com/content/v1/538500e4e4b0fa9e95efc7b9/1626109734022-EKOXSZ1NNR00A84L7S0W/Coffee+Crunch+Slice.gif?format=1000w',
                    mealName: 'Desserts',
                    mealDescription:
                    'Life is better with a good dessert.'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
