import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/food_model.dart';
import '../../models/meal_model.dart';
import '../../models/category_model.dart';

class RestaurantDatabase {
  static final RestaurantDatabase instance = RestaurantDatabase._init();

  static Database? _database;

  RestaurantDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('restaurant.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB (Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';
    const doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
    CREATE TABLE category (
      category_id $idType,
      category_image $textType,
      category_name $textType,
      description $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE meal (
      meal_id $idType,
      meal_image $textType,
      meal_name $textType,
      description $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE food (
      food_id $idType,
      calories $doubleType,
      category_id $intType REFERENCES category(category_id),
      meal_id $intType REFERENCES meal(meal_id),
      description $textType,
      discount $doubleType,
      food_image $textType,
      food_name $textType,
      preparation_time $doubleType,
      price $doubleType,
      rating $doubleType
     
    )
    ''');


  }

  Future<Category> createCategory(Category category) async {
    final db = await instance.database;

    final id = await db.insert('category', category.toJsonDb());
    return category.copy(categoryId: id);
  }
  Future<Meal> createMeal(Meal meal) async {
    final db = await instance.database;

    final id = await db.insert('meal', meal.toJsonDb());
    return meal.copy(mealId: id);
  }
  Future<Food> createFood(Food food) async {
    final db = await instance.database;

    final id = await db.insert('food', food.toJson());
    return food.copy(foodId: id);
  }

  Future<List<Category>> readCategory() async {
    final db = await instance.database;

    final maps = await db.query('category');

    return List.generate(maps.length, (i) {
      final json = maps[i];
      return Category.fromJson(json);
    });
  }


  Future<List<Meal>> readMeal() async {
    final db = await instance.database;

    final maps = await db.query('meal');

    return List.generate(maps.length, (i) {
      final json = maps[i];
      return Meal.fromJson(json);
    });
  }


  Future<List<Food>> readFoodByCategory(int categoryId) async {
    final db = await instance.database;

    final maps = await db.rawQuery('SELECT * FROM food WHERE category_id = $categoryId');

    return List.generate(maps.length, (i) {
      final json = maps[i];
      return Food.fromJson(json);
    });
  }

  Future<List<Category>> deleteCategory() async {
    final db = await instance.database;

    final maps = await db.rawQuery('DELETE FROM category');

    return List.generate(maps.length, (i) {
      final json = maps[i];
      return Category.fromJson(json);
    });
  }

}