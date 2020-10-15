import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yovie_app/components/texts/text_box_with_subtitle.dart';
import 'package:yovie_app/models/pose.dart';

class StepByStepSlider extends StatefulWidget {
  final bool autoPlay;
  final ArrayValue array;

  const StepByStepSlider ({Key key, this.autoPlay, this.array}) : super (key: key);

  @override
  _StepByStepSliderState createState() => _StepByStepSliderState();
}

class _StepByStepSliderState extends State<StepByStepSlider> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int currentPage = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    /*
    Timer timer = new Timer(new Duration(seconds: 5), () {
      setState(() {
        currentPage++;
      });
    });
     */
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        initialPage: currentPage,
        onPageChanged: (int page, CarouselPageChangedReason carouselPageChangedReason){
          setState(() {
            currentPage = page;
          });
        },
        autoPlay: widget.autoPlay,
        //pauseAutoPlayOnTouch: widget.autoPlay,
        autoPlayInterval: Duration(seconds: 30),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
      ),
      items: widget.array.values.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: TextBoxWithSubtitle(
                title: "Step ${currentPage + 1}",
                text: i.stringValue,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
