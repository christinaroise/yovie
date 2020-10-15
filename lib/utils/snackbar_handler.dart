import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class SnackBarHandler{
  
  static showAddedPoseToPlaylist(BuildContext context){
    final snackBar = SnackBar(
      content: Text('Pose has been added to playlist'),
      backgroundColor: CustomTheme.yellowColor,
    );
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static showPoseExistsInPlaylist(BuildContext context){
    final snackBar = SnackBar(
        content: Text('Pose has already been added'),
        backgroundColor: CustomTheme.yellowColor,
    );
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static showRemovedPoseFromPlaylist(BuildContext context){
    final snackBar = SnackBar(
        content: Text('Pose has been removed from playlist'),
        backgroundColor: CustomTheme.yellowColor,
    );
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }
}