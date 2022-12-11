import 'package:flutter/cupertino.dart';

import 'food_image_timer.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: const EdgeInsets.only(top: 20),
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FoodImageTimer(
            time: ' 20 min',
            networkImage:
            'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
          ),
          SizedBox(
            width: 10,
          ),
          FoodImageTimer(
            time: ' 20 min',
            networkImage:
            'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
          ),
          SizedBox(
            width: 10,
          ),
          FoodImageTimer(
            time: ' 20 min',
            networkImage:
            'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
          ),
          SizedBox(
            width: 10,
          ),
          FoodImageTimer(
            time: ' 20 min',
            networkImage:
            'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
          ),
          SizedBox(
            width: 10,
          ),
          FoodImageTimer(
            time: ' 20 min',
            networkImage:
            'https://www.aicr.org/wp-content/uploads/2020/12/AICR-NAP-Infographic-small.png',
          ),
        ],
      ),
    );
  }
}
