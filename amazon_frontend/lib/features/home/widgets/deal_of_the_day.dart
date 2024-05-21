import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image.network(
          'https://t4.ftcdn.net/jpg/06/01/14/23/360_F_601142328_VnY6DMf1sC0RULodemaCSrvXSlFhO1lA.jpg',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            "\$ 200",
            maxLines: 2,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 3, right: 40),
          child: const Text(
            "Mackbook Pro",
            maxLines: 2,
            style: TextStyle(
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.network(
                  'https://atlas-content-cdn.pixelsquid.com/assets_v2/246/2461903618920420852/jpeg-600/G03.jpg?modifiedAt=1',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.network(
                  'https://e7.pngegg.com/pngimages/918/793/png-clipart-macbook-pro-13-inch-macbook-air-laptop-macbook-gadget-electronics-thumbnail.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlmPaOPOYZNkBUmtPuvISIwyZHFxYERgVPo3hwRLDvpg&s',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.network(
                  'https://www.apple.com/newsroom/images/product/mac/standard/Apple-MacBook-Pro-M2-13-availability-June-2022-hero_big.jpg.small.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            "See all deals",
            maxLines: 2,
            style: TextStyle(
              color: Colors.cyan,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
