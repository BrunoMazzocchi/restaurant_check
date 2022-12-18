import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  final String phrase;
  final String question;

  const CustomTopBar({
    Key? key,
    required this.phrase,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'User';
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.restaurant_menu_outlined,
                        size: 35,
                      ))
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.search,
                        size: 35,
                      ))
                ],
              )
            ],
          ),
          Container(
              // TODO: Check the screen width with variables
              width: 600,
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$phrase $name, ',
                    style: const TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                  Text(
                    question,
                    style: const TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
