import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/bloc/colors.dart';

import '../widgets/order.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
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
                          image: const DecorationImage(
                            image: AssetImage("assets/img/p1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout,
                          size: 30,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "  @johndoe",
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
      ),
    );
  }
}
