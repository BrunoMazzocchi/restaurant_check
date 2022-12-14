import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/widgets/food_meal_card.dart';

import '../bloc/restaurant_bloc.dart';
import '../models/meal_model.dart';

class MealList extends StatelessWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    RestaurantMenuBloc menuBloc = BlocProvider.of(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Separated in meals',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          FutureBuilder<List<Meal>>(
            future: menuBloc.fetchMeal(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    for (var meal in snapshot.data!)
                      FoodMealCard(
                        meal: meal,
                      ),
                  ],
                );
              } else {
                return const Center(child: Text('No meals'));
              }
            },
          ),
        ],
      ),
    );
  }
}
