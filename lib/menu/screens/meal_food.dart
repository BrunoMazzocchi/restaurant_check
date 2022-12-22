import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/cart/screens/main_cart.dart';
import 'package:restaurant_check/menu/widgets/food_list.dart';

import '../../main/screens/settings.dart';
import '../../main/widgets/custom_top_bar.dart';
import '../domain/models/meal_model.dart';
import '../widgets/meal_food_list.dart';


class MealFood extends StatelessWidget {
  final Meal meal;

  const MealFood({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const CustomTopBar(
            phrase: "Let's order, ",
            question: "What do you want to eat today?",
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.mealName.toString(),
                  style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoSearchTextField(
                  onChanged: (String value) {},
                  onSubmitted: (String value) {},
                )
              ],
            ),
          ),
          SizedBox(
            width: width,
            height: height - 256,
            child: ListView(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                      const EdgeInsets.only(top: 30, left: 20, right: 20),
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Popular",
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Most ordered food in this category",
                            style: TextStyle(
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
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const FoodList(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: MealFoodList(
                      mealId: meal.mealId!.toInt(),),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainCart()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
