import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/bloc/restaurant_bloc.dart';
import 'package:restaurant_check/user/screens/sign_in_view.dart';

import '../../menu/widgets/order.dart';
import '../domain/bloc/user_bloc.dart';
import '../domain/models/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {

  late Future<User?> data = Provider.of<UserBloc>(context, listen: false)
      .fetchUser();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = Provider.of<UserBloc>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder<User?>(
        future: data,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: width,
                        height: height * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz_outlined,
                                  size: 30,
                                ),
                                color: Colors.white,
                              ),
                              Container(
                                width: 125,
                                height: 125,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage('${snapshot.data?.image}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  userBloc.logOutUser();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignInView()));
                                },
                                icon: const Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Text(
                            '${snapshot.data?.name}',
                            style: const TextStyle(
                              fontFamily: "SF Pro",
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${snapshot.data?.nickname}',
                            style: const TextStyle(
                                fontFamily: "SF Pro",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: SizedBox(
                        child: Column(
                      children: [
                        const Text(
                          "Recent orders",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: const [
                            Order(),
                            Order(),
                          ],
                        )
                      ],
                    )),
                  )
                ],
              );
              break;
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
