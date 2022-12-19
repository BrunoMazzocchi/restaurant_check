import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/menu/widgets/food_meal_card.dart';

import '../domain/bloc/menu_bloc.dart';
import '../domain/models/meal_model.dart';

class MealList extends StatefulWidget {
  const MealList({Key? key}) : super(key: key);



  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    late Future<List<Meal>> data = Provider.of<MenuBloc>(context, listen: false)
        .fetchMeal();


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
            future: data,
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
