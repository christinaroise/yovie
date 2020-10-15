import 'package:flutter/material.dart';
import 'package:yovie_app/components/cards/info_card.dart';
import 'package:yovie_app/models/pose.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yovie_app/plugin_extensions/shared_pref.dart';
import 'package:yovie_app/screens/pose_information/pose_information.dart';
import 'package:yovie_app/service/api.dart';
import 'package:yovie_app/utils/snackbar_handler.dart';
import 'package:yovie_app/utils/utils.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String posesData = "https://firestore.googleapis.com/v1/projects/yovie-2c370/databases/(default)/documents/poses/";
  ApiService _apiService = ApiService();
  List<Document> poses = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    _getData();
  }

  _getData() async {
    Pose pose = await _apiService.fetchData(posesData);
    setState(() {
      poses = pose.documents;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 580,
            viewportFraction: 1.0,
            autoPlay: false,),
          items: poses.map((pose) {
            return Builder(
              builder: (BuildContext context) {
                return InfoCard(
                  title: pose.fields.nickname.stringValue.toUpperCase(),
                  subtitle: pose.fields.name.stringValue,
                  description: pose.fields.description.stringValue,
                  imageUrl: pose.fields.illustration.stringValue,
                  onPressed: (){
                    Util.navigateToPage(PoseInformation(pose: pose), context);
                  },
                  onPressedIcon: () async {
                    if(await SharedPref.isPoseInPlaylist(pose) == false){
                      await SharedPref.sendDataToLocal(pose);
                      SnackBarHandler.showAddedPoseToPlaylist(context);
                    }else{
                      SnackBarHandler.showPoseExistsInPlaylist(context);
                    }
                  },
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}