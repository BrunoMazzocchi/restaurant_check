import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/menu/widgets/food_in_specific_list.dart';

import '../../bloc/restaurant_bloc.dart';
import '../domain/models/food_model.dart';

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
        Padding(
          padding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: FutureBuilder<List<Food>>(
              future: menuBloc.fetchFoodByCategoryId(categoryId),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const Text(
                        "Right now there is no food in this category");
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
