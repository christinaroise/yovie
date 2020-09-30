import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yovie_app/theme/style.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: CustomTheme.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
            );
          },
        );
      }).toList(),
    );
  }
}
