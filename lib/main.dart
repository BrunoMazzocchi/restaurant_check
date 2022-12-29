import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/cart/domain/bloc/order_bloc.dart';
import 'package:restaurant_check/menu/domain/bloc/menu_bloc.dart';
import 'package:restaurant_check/user/domain/bloc/user_bloc.dart';
import 'package:restaurant_check/user/screens/sign_in_view.dart';

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
    return MultiProvider(
      providers: [
        Provider<MenuBloc>(
          create: (_) => MenuBloc(),
        ),
        Provider<UserBloc>(
          create: (_) => UserBloc(),
        ),
        Provider<OrderBloc>(
          create: (_) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Restaurant Check',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Scaffold(
          body: SignInView(),
        ),
      ),
    );
  }
}
