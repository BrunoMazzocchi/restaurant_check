import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/models/category_model.dart';
import 'package:restaurant_check/widgets/category_food_list.dart';
import 'package:restaurant_check/widgets/custom_top_bar.dart';
import 'package:restaurant_check/widgets/food_list.dart';

class CategoryFood extends StatelessWidget {
  final Category category;

  const CategoryFood({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: width,
      height: height,
      child: Column(
        children: [
          const CustomTopBar(
            phrase: "Let's order, ",
            question: "What do you want to eat today?",
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.categoryName.toString(),
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
            height: height - 310,
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
                  child: CategoryFoodList(
                      categoryId: category.categoryId!.toInt()),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 2.5,
            ),
            child: CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Check your cart'),
            ),
          ),
        ],
      ),
    ));
  }
}
