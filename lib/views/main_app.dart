import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_top_bar.dart';
import '../widgets/food_categories_list.dart';
import '../widgets/food_list.dart';
import '../widgets/menu_list.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            const CustomTopBar(),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: 500,
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
                  MenuList(),
                ],
              ),
            )
          ],
        );
  }
}
