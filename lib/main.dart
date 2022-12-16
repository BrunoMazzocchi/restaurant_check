import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/bloc/restaurant_bloc.dart';
import 'package:restaurant_check/navigation.dart';
import 'package:restaurant_check/views/sign_in_view.dart';

void main() {

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return BlocProvider(
      bloc: RestaurantMenuBloc(),
      child: MaterialApp(
        title: 'Restaurant Check',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SignInView(),
      ),
    );
  }
}
