import 'package:flutter/material.dart';
import 'package:yovie_app/components/buttons/custom_button.dart';
import 'package:yovie_app/components/texts/h1_title.dart';
import 'package:yovie_app/components/texts/text_block.dart';
import 'package:yovie_app/models/pose.dart';
import 'package:yovie_app/plugin_extensions/shared_pref.dart';
import 'package:yovie_app/theme/style.dart';
import 'package:yovie_app/utils/snackbar_handler.dart';


class PoseInformation extends StatefulWidget {
  final Document pose;

  const PoseInformation ({Key key, this.pose}) : super(key: key);

  @override
  _PoseInformationState createState() => _PoseInformationState();
}

class _PoseInformationState extends State<PoseInformation> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(widget.pose.fields.illustration.stringValue.toString()),
                  AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      iconTheme: IconThemeData(
                        color: Colors.black87,
                      ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H1Title(
                        title: widget.pose.fields.nickname.stringValue.toString().toUpperCase(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                            "Pose information",
                          style: TextStyle(
                              color: CustomTheme.darkBlueColor,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      TextBlock(
                        title: "Sankrit Name",
                        paragraph: widget.pose.fields.name.stringValue.toString(),
                      ),
                      TextBlock(
                        title: "Pose Level",
                        paragraph: widget.pose.fields.poseLevel.integerValue.toString(),
                      ),
                      TextBlock(
                        title: "Modifications and Props",
                      paragraph: widget.pose.fields.modificationsAndProps.stringValue.toString(),
                      ),
                      TextBlock(
                        title: "Deepen the Pose",
                        paragraph: widget.pose.fields.deepenThePose.stringValue.toString(),
                      ),
                      TextBlock(
                        title: "Beginner's Tip",
                      paragraph: widget.pose.fields.beginnersTip.stringValue.toString(),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Container(
                            width: double.infinity,
                            child: CustomButton(
                              title: "Add to playlist",
                              onTap: () async {
                                if(await SharedPref.isPoseInPlaylist(widget.pose) == false){
                                  await SharedPref.sendDataToLocal(widget.pose);
                                  SnackBarHandler.showAddedPoseToPlaylist(context);
                                }else{
                                  SnackBarHandler.showPoseExistsInPlaylist(context);
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
