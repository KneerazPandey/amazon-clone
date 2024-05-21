import 'package:amazon_frontend/core/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: AppData.carouselImages.map((image) {
        return Builder(builder: (BuildContext context) {
          return Image.network(
            image,
            height: 200,
            fit: BoxFit.cover,
          );
        });
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
