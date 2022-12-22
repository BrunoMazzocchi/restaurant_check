class Food {
  Food({
      required this.foodId,
    required   this.foodName,
    required   this.description,
    required   this.foodImage,
    required   this.price,
    required   this.discount,
    required   this.rating,
    required    this.calories,
    required    this.preparationTime,
    required    this.categoryId,
    required   this.mealId,});

  Food.fromJson(dynamic json) {
    foodId = json['food_id'];
    foodName = json['food_name'];
    description = json['description'];
    foodImage = json['food_image'];
    price = json['price'];
    discount = json['discount'];
    rating = json['rating'];
    calories = json['calories'];
    preparationTime = json['preparation_time'];
    categoryId = json['category_id'];
    mealId = json['meal_id'];
  }
  int? foodId;
  String? foodName;
  String? description;
  String? foodImage;
  double? price;
  double? discount;
  double? rating;
  double? calories;
  double? preparationTime;
  int? categoryId;
  int? mealId;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['food_id'] = foodId;
    map['food_name'] = foodName;
    map['description'] = description;
    map['food_image'] = foodImage;
    map['price'] = price;
    map['discount'] = discount;
    map['rating'] = rating;
    map['calories'] = calories;
    map['preparation_time'] = preparationTime;
    map['category_id'] = categoryId;
    map['meal_id'] = mealId;
    return map;
  }

  Food copy({
    int? foodId,
    String? foodName,
    String? description,
    String? foodImage,
    double? price,
    double? discount,
    double? rating,
    double? calories,
    double? preparationTime,
    int? categoryId,
    int? mealId,
  }) =>
      Food(
        foodId: foodId ?? this.foodId,
        foodName: foodName ?? this.foodName,
        description: description ?? this.description,
        foodImage: foodImage ?? this.foodImage,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        rating: rating ?? this.rating,
        calories: calories ?? this.calories,
        preparationTime: preparationTime ?? this.preparationTime,
        categoryId: categoryId ?? this.categoryId,
        mealId: mealId ?? this.mealId,
      );

}