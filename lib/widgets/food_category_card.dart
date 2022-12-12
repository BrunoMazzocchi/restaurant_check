import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/models/category_model.dart';
import 'package:restaurant_check/views/category_food.dart';

class FoodCategoryImage extends StatelessWidget {
  final Category category;


  const FoodCategoryImage({
    Key? key,
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
              image: Image.network(category.categoryImage.toString()).image,
              width: 30,
            ),
            Text(
              category.categoryName.toString(),
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
            MaterialPageRoute(builder: (context) =>  CategoryFood(category: category,)));
      },
    );
  }
}
