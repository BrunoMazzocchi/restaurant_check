import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/widgets/food_in_category_image.dart';

import '../bloc/restaurant_bloc.dart';
import '../models/food_model.dart';
import '../resources/database/restaurant_db.dart';

class CategoryFoodList extends StatelessWidget {
  final int categoryId;

  const CategoryFoodList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantMenuBloc menuBloc = BlocProvider.of(context);
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
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 500,
          child: FutureBuilder<List<Food>>(
            future: menuBloc.fetchFoodByCategoryId(categoryId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final foods = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 0, bottom: 20),
                  scrollDirection: Axis.vertical,
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    if (food.categoryId == categoryId) {
                      return Column(
                        children: [
                          FoodInCategoryImage(
                            food: food,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else {
                      return const Text("Right now there is no food in this category");
                    }
                  },
                );
              } else {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
