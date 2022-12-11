import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_check/navigation.dart';
import 'package:restaurant_check/views/main_app.dart';
import 'package:restaurant_check/widgets/custom_top_bar.dart';
import 'package:restaurant_check/widgets/food_categories_list.dart';
import 'package:restaurant_check/widgets/food_list.dart';
import 'package:restaurant_check/widgets/menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro'),
      home: const Navigation(),
    );
  }
}
