import 'package:flutter/cupertino.dart';
import 'package:restaurant_check/widgets/food_in_category_image.dart';

import '../models/food_models.dart';

class CategoryFoodList extends StatelessWidget {
  const CategoryFoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All',
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 500,
          child: ListView(scrollDirection: Axis.vertical, children: [
            FoodInCategoryImage(
                food: Food(
              id: 1,
              name: 'Sushi plate with salmon',
              description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              image: 'https://www.tntsupermarket.com/media/catalog/product/5/0/501134.png?auto=webp&format=png&width=556&height=556&fit=cover',
              price: 10,
              discount: 0,
              ratings: 5,
              time: '45 min',
              calories: '35',
            )),
            const SizedBox(
              height: 10,
            ),
            FoodInCategoryImage(
                food: Food(
                  id: 1,
                  name: 'Sushi plate with salmon',
                  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  image: 'https://www.tntsupermarket.com/media/catalog/product/5/0/501134.png?auto=webp&format=png&width=556&height=556&fit=cover',
                  price: 10,
                  discount: 0,
                  ratings: 5,
                  time: '45 min',
                  calories: '35',
                )),
          ]),
        )
      ],
    );
  }
}


