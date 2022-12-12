import 'food_model.dart';

class Meal {
  Meal({
    required   this.mealId,
    required  this.mealName,
    required    this.mealImage,
    required     this.description,
    required    this.food,});

  Meal.fromJson(dynamic json) {
    mealId = json['meal_id'];
    mealName = json['meal_name'];
    mealImage = json['meal_image'];
    description = json['description'];
    if (json['food'] != null) {
      food = [];
      json['food'].forEach((v) {
        food?.add(Food.fromJson(v));
      });
    }
  }
  int? mealId;
  String? mealName;
  String? mealImage;
  String? description;
  List<Food>? food;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meal_id'] = mealId;
    map['meal_name'] = mealName;
    map['meal_image'] = mealImage;
    map['description'] = description;
    if (food != null) {
      map['food'] = food?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Map<String, dynamic> toJsonDb() {
    final map = <String, dynamic>{};
    map['meal_id'] = mealId;
    map['meal_name'] = mealName;
    map['meal_image'] = mealImage;
    map['description'] = description;

    return map;
  }

  Meal copy ({
    int? mealId,
    String? mealName,
    String? mealImage,
    String? description,
    List<Food>? food,
  }) =>
      Meal(
        mealId: mealId ?? this.mealId,
        mealName: mealName ?? this.mealName,
        mealImage: mealImage ?? this.mealImage,
        description: description ?? this.description,
        food: food ?? this.food,
      );

}