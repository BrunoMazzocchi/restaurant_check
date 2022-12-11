import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_top_bar.dart';
import '../widgets/food_categories_list.dart';
import '../widgets/food_list.dart';
import '../widgets/meal_list.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            const CustomTopBar(phrase: 'Hello there', question: 'What do you want to eat today?',),
            SizedBox(
              width: 400,
              height: 650,
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    width: 800,
                    height: 700,
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
        );
  }
}
