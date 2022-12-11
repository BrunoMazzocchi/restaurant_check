import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/views/category_food.dart';

class FoodCategoryImage extends StatelessWidget {
  final String networkImage;
  final String category;

  const FoodCategoryImage({
    Key? key,
    required this.networkImage,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: Image.network(networkImage).image,
              width: 30,
            ),
            Text(
              category,
              style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CategoryFood(category: 'Sushi',)));
      },
    );
  }
}
