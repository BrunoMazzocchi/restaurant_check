
import 'food_model.dart';

class Category {
  Category({
    required  this.categoryId,
    required   this.categoryName,
    required   this.categoryImage,
    required   this.description,
    required   this.food,});

  Category.fromJson(dynamic json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    description = json['description'];
    if (json['food'] != null) {
      food = [];
      json['food'].forEach((v) {
        food!.add(Food.fromJson(v));
      });
    }
  }
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  String? description;
  List<Food>? food;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['category_image'] = categoryImage;
    map['description'] = description;
    if (food != null) {
      map['food'] = food?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Map<String, dynamic> toJsonDb() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['category_image'] = categoryImage;
    map['description'] = description;
    return map;
  }



  Category copy ({
    int? categoryId,
    String? categoryName,
    String? categoryImage,
    String? description,
    List<Food>? food,
  }) =>
      Category(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
        description: description ?? this.description,
        food: food ?? this.food,
      );



}