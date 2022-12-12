import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/widgets/meal_image.dart';

import '../bloc/restaurant_bloc.dart';
import '../models/meal_model.dart';

class MealList extends StatelessWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(

                      height: 335,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MealImage(
                                meal: snapshot.data![index],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    )
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
