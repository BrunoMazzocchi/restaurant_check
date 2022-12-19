import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../menu/widgets/food_categories_list.dart';
import '../../menu/widgets/food_list.dart';
import '../../menu/widgets/meal_list.dart';
import '../widgets/custom_top_bar.dart';
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Padding( 
      padding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          const CustomTopBar(phrase: 'Hello there', question: 'What do you want to eat today?',),
          SizedBox(
            width: width,
            height: height - 252,
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Today's recommendations! ",
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      FoodList(),
                      FoodCategoriesList(),
                      MealList(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
