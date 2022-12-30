import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_check/user/screens/settings.dart';
import 'package:restaurant_check/user/screens/sign_in_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../cart/widgets/profile_orders.dart';
import '../domain/bloc/user_bloc.dart';
import '../domain/models/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  late Future<User?> userData =
      Provider.of<UserBloc>(context, listen: false).fetchUser();


  @override
  void initState() {
    userData = Provider.of<UserBloc>(context, listen: false).fetchUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = Provider.of<UserBloc>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget shimmerUser() {
      return Shimmer(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[300]!,
              Colors.grey[100]!,
              Colors.grey[300]!,
            ],
          ),
          child: Column(
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Settings(),
                                ),
                              );
                            },
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
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              userBloc.logOutUser();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInView()));

                              SnackBar snackBar = const SnackBar(
                                content: Text('Logged out'),
                                duration: Duration(seconds: 2),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: const Icon(
                              Icons.logout,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Text(
                        'Loading',
                        style: TextStyle(
                          fontFamily: "SF Pro",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Loading',
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),
              const ProfileOrders(),
            ],
          ));
    }

    return FutureBuilder<User?>(
        future: userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Settings(),
                                  ),
                                );
                              },
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
                                        builder: (context) =>
                                        const SignInView()));

                                SnackBar snackBar = const SnackBar(
                                  content: Text('Logged out'),
                                  duration: Duration(seconds: 2),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
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
                const ProfileOrders(),
              ],
            );
          } else {
            return shimmerUser();
          }
        });
  }
}
