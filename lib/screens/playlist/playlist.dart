import 'package:flutter/material.dart';
import 'package:yovie_app/components/error_handling/no_pose_in_playlist.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/components/texts/h2_title.dart';
import 'package:yovie_app/components/tiles/tile.dart';
import 'package:yovie_app/models/pose.dart';
import 'package:yovie_app/plugin_extensions/shared_pref.dart';
import 'package:yovie_app/theme/style.dart';
import 'package:yovie_app/utils/snackbar_handler.dart';
import 'package:yovie_app/utils/utils.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Document> poseList = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();

    _getPoseList();
  }

  _getPoseList() async {
    var list = await SharedPref.getDataFromLocal();
    setState(() {
      poseList = list;
    });
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        H2Title(
                            title: "Playlist of Poses"
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Footnote(
                              title: "0h - 7,5 min"
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 425,
                  decoration: new BoxDecoration(
                      color: CustomTheme.fadedPrimaryColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                    child: (poseList.length > 0)
                        ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: poseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            // Each Dismissible must contain a Key. Keys allow Flutter to
                            // uniquely identify widgets.
                            key: Key(Util.createUniqueKey()),
                            // Provide a function that tells the app
                            // what to do after an item has been swiped away.
                            onDismissed: (direction) {
                              // Remove the item from the data source.
                              setState(() {
                                poseList.removeAt(index);
                              });
                              // Update shared preferences
                              SharedPref.removePoseFromPlaylistOfPoses(index);
                              // Then show snackbar
                              SnackBarHandler.showRemovedPoseFromPlaylist(context);

                            },
                            // Show a red background as the item is swiped away.
                            background: Container(color: Colors.grey),
                            child: Tile(
                              nickname: poseList[index].fields.nickname.stringValue,
                              poseLevel: poseList[index].fields.poseLevel.integerValue.toString(),
                              imageUrl: poseList[index].fields.illustration.stringValue,
                            ),
                          );
                        }
                    ) : NoPoseInPlayList()
                  )
              )
            ],
          )
      ),
    );
  }
}
