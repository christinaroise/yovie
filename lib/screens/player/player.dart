import 'package:flutter/material.dart';
import 'package:yovie_app/components/appbars/custom_appbar.dart';
import 'package:yovie_app/components/error_handling/no_pose_in_playlist.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/models/pose.dart';
import 'package:yovie_app/plugin_extensions/shared_pref.dart';
import 'package:yovie_app/screens/player/components/media_player.dart';
import 'package:yovie_app/screens/player/components/step_by_step_slider.dart';
import 'package:yovie_app/theme/style.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isAutoPlayOn = false;
  Document currentPose = null;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    _getCurrentPose();
  }

  _getCurrentPose() async {
   var poseFromPlaylistOfPoses = await SharedPref.getPoseFromPlaylistOfPoses(currentIndex);
   setState(() {
     currentPose = poseFromPlaylistOfPoses;
   });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _pauseOrPlayPose(){
      setState(() {
        isAutoPlayOn = !isAutoPlayOn;
      });
  }

  _playPreviousPose(){
    if(currentIndex > 0){
      setState(() {
        currentIndex--;
      });
      _getCurrentPose();
    }
  }

  _playNextPose() async{
    var list = await SharedPref.getDataFromLocal();
    if(currentIndex < list.length - 1){
      setState(() {
        currentIndex++;
      });
      _getCurrentPose();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: (currentPose != null) ? Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Center(
                              child: Image.network(
                                  currentPose.fields.illustration.stringValue,
                                  height: 300
                              )
                          )
                      ),
                    ),
                    CustomAppbar(
                        title: currentPose.fields.nickname.stringValue
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
                    child: MediaPlayer(
                      onTapPlayPause: (){
                        _pauseOrPlayPose();
                      },
                      onTapPrevious: (){
                        _playPreviousPose();
                      },
                      onTapNext: (){
                        _playNextPose();
                      },
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StepByStepSlider(
                              autoPlay: isAutoPlayOn,
                              array: currentPose.fields.stepByStep.arrayValue
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
          )
      ) : NoPoseInPlayList()
    );
  }
}


/*


 */
