import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/menu/domain/bloc/menu_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/models/food_model.dart';
import 'today_recommendation.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  late Future<List<Food>> data =
      Provider.of<MenuBloc>(context, listen: false).fetchFood();


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
      child: Container(
        height: 140,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 140,
      child: FutureBuilder<List<Food>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    TodayRecommendation(
                      food: snapshot.data![index],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return shimmerList();
          }

          return shimmerList();
        },
      ),
    );
  }
}
