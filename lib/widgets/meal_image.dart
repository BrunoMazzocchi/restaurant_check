import 'package:flutter/cupertino.dart';

class MealImage extends StatelessWidget {
  final String networkImage;
  final String mealName;
  final String mealDescription;

  const MealImage(
      {Key? key,
      required this.networkImage,
      required this.mealName,
      required this.mealDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(223, 226, 232, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image(
          image: Image.network(
                  networkImage)
              .image,
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              mealName,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                mealDescription,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ]),
    );
  }
}
