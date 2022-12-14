import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/bloc/restaurant_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../models/food_model.dart';
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
      child: FutureBuilder<List<Food>>(
        future: BlocProvider.of<RestaurantMenuBloc>(context).fetchFood(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const Card(
                    color: Colors.white,
                    child: Text('Loading'),
                  ),
                ),
              );
            case ConnectionState.done:
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodImageTimer(food: snapshot.data![index]),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
              );
          }
        },
      ),
    );
  }
}
