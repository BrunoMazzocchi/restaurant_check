import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_check/navigation.dart';

void main() {
  runApp(
      const MaterialApp(
        home: Navigation(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF Pro',
        primaryColor: Colors.lightGreenAccent[800],
      ),
      home: const Navigation(),
    );
  }
}
