import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food_models.dart';
import 'food_image_timer.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 140,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        FoodImageTimer(
          food: Food(
            id: 1,
            name: 'Sushi plate with salmon',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            image:
                'https://www.tntsupermarket.com/media/catalog/product/5/0/501134.png?auto=webp&format=png&width=556&height=556&fit=cover',
            price: 10,
            discount: 0,
            ratings: 4.5,
            calories: '200',
            time: '45 min',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FoodImageTimer(
          food: Food(
            id: 2,
            name: 'Chicken salad',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            image:
                'https://freepngimg.com/thumb/food/139184-food-plate-healthy-free-photo.png',
            price: 10,
            discount: 0,
            ratings: 5,
            calories: '200',
            time: '20 min',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FoodImageTimer(
          food: Food(
            id: 2,
            name: 'Salmon with potatoes',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            image:
                'https://images.ctfassets.net/4frik3v39clf/5CvdEQ4ilCa9iRkGROnOwW/dd516110e6d37e91a8e3439d05163207/Smothered_Pork_Chops_with_Home_Fries_and_Green_Beans_-_Week_33.png',
            price: 10,
            discount: 0,
            ratings: 4.5,
            calories: '200',
            time: '30 min',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FoodImageTimer(
          food: Food(
            id: 2,
            name: 'Chicken with rice',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            image:
                'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
            price: 10,
            discount: 0,
            ratings: 4.5,
            calories: '200',
            time: '40 min',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FoodImageTimer(
          food: Food(
            id: 2,
            name: 'Beaf with rice',
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            image:
                'https://www.menu24.hu/core/mod/menu24/oldal/weboldal/1/etterem/2020/10/09/49/menu/557/3540/big_24-gyros-tal-sultburgonyaval.png',
            price: 10,
            discount: 0,
            ratings: 4.5,
            calories: '200',
            time: '20 min',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ]),
    );
  }
}
