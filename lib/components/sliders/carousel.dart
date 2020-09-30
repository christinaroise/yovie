import 'package:flutter/material.dart';
import 'package:yovie_app/components/cards/info_card.dart';
import 'package:yovie_app/models/pose.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yovie_app/service/api.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String posesData = "https://firestore.googleapis.com/v1/projects/yovie-2c370/databases/(default)/documents/poses/";
  ApiService _apiService = ApiService();
  Future<Pose> pose;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    pose = _apiService.fetchData(posesData);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pose>(
        future: pose,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider(
                options: CarouselOptions(
                  height: 550,
                  viewportFraction: 1.0,
                  autoPlay: false,),
                items: <Widget> [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoCard(
                        title: "boat".toUpperCase(),
                        subtitle: "Navasana",
                        description: "An ab and deep hip flexor strengthener, Paripurna Navasana requires you to balance on the tripod of your sitting bones and tailbone.",
                      ),
                    ],
                  ),
                ]
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
              height: 600,
              child: Center(
                child: CircularProgressIndicator(
                    strokeWidth: 2),
              )
          );
        },
      );
  }
}
