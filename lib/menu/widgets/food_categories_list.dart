import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../domain/bloc/menu_bloc.dart';
import '../domain/models/category_model.dart';
import 'food_category_card.dart';


class FoodCategoriesList extends StatefulWidget {
  const FoodCategoriesList({Key? key}) : super(key: key);


  @override
  State<FoodCategoriesList> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategoriesList> {

  late Future<List<Category>> data = Provider.of<MenuBloc>(context, listen: false)
      .fetchCategory();

  Widget shimmerList() {
    return Shimmer(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.grey[300]!,
            Colors.grey[100]!,
            Colors.grey[300]!,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context)  {

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
            child: FutureBuilder<List<Category>>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FoodCategoryImage(category: snapshot.data![index]),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return shimmerList();
                }
              },
            ),
          )
        ],
      ),
    );
  }

}
