import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/menu/widgets/food_in_specific_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/restaurant_bloc.dart';
import '../domain/bloc/menu_bloc.dart';
import '../domain/models/food_model.dart';

class CategoryFoodList extends StatefulWidget {
  final int categoryId;

  const CategoryFoodList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<CategoryFoodList> createState() => _CategoryFoodListState();
}

class _CategoryFoodListState extends State<CategoryFoodList> {

  late Future<List<Food>> data = Provider.of<MenuBloc>(context, listen: false)
      .fetchFoodByCategoryId(widget.categoryId);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All',
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: FutureBuilder<List<Food>>(
              future: data,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  return SizedBox(
                    width: width,
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
                    final foods = snapshot.data!;
                    return Column(
                      children: [
                        for (var food in foods)
                          FoodInSpecificList(
                            food: food,
                          ),
                      ],
                    );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
