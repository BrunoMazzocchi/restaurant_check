import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodImageTimer extends StatelessWidget {
  final String time;
  final String networkImage;

  const FoodImageTimer({
    Key? key,
    required this.time,
    required this.networkImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(223, 226, 232, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
              width: 90,
              height: 90,
              image: Image.network(networkImage).image,
              fit: BoxFit.cover),
          Row(
            children: [
              Row(
                children:  [
                  const Icon(
                    Icons.av_timer_rounded,
                    color: Colors.grey,
                    size: 25,
                  ),
                  Text(time),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
