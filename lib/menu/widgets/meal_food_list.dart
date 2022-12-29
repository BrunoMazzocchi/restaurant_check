import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/menu/widgets/food_in_specific_list.dart';
import '../domain/bloc/menu_bloc.dart';
import '../domain/models/food_model.dart';

class MealFoodList extends StatefulWidget {
  final int mealId;

  const MealFoodList({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  @override
  State<MealFoodList> createState() => _MealFoodListState();
}

class _MealFoodListState extends State<MealFoodList> {
  late Future<List<Food>> data = Provider.of<MenuBloc>(context, listen: false)
      .fetchFoodByMealId(widget.mealId);



  @override
  Widget build(BuildContext context) {
    MenuBloc menuBloc = Provider.of(context);
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
                    return const Text(
                        "Right now there is no food in this meal category");
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
