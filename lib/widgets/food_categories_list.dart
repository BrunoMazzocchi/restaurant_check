import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'food_category_card.dart';

class FoodCategoriesList extends StatelessWidget {
  const FoodCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Some categories',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                FoodCategoryImage(
                  networkImage:
                      'https://cdn-icons-png.flaticon.com/512/3183/3183480.png',
                  category: 'Sushi',
                ),
                SizedBox(
                  width: 20,
                ),
                FoodCategoryImage(
                  networkImage:
                      'https://cdn-icons-png.flaticon.com/512/2819/2819194.png',
                  category: 'Fast Food',
                ),
                SizedBox(
                  width: 20,
                ),
                FoodCategoryImage(
                  networkImage:
                      'https://cdn-icons-png.flaticon.com/512/4310/4310157.png',
                  category: 'Healthy Food',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
