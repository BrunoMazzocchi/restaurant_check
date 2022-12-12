import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../bloc/restaurant_bloc.dart';
import '../models/category_model.dart';
import '../resources/database/restaurant_db.dart';
import 'food_category_card.dart';

class FoodCategoriesList extends StatelessWidget {
  const FoodCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    RestaurantMenuBloc menuBloc = BlocProvider.of(context);


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
              future: menuBloc.fetchCategory(),
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
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
