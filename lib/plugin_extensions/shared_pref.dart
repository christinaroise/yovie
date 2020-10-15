import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yovie_app/models/pose.dart';

class SharedPref {

  static Future<List<Document>> getDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var sharedPreferencesList = prefs.getStringList('playlistOfPoses');
    if(sharedPreferencesList == null){
      return [];
    }

    List<Document> playlistOfPoses = [];

    for(String poseInLocalStorage in sharedPreferencesList){
      playlistOfPoses.add(Document.fromJson(json.decode(poseInLocalStorage)));
    }

    return playlistOfPoses;
  }

  static Future<Document> getPoseFromPlaylistOfPoses(index) async {
    var list = await getDataFromLocal();
    if(list.length > 0){
      return list[index];
    }else {
      return null;
    }
  }

  static sendDataToLocal(Document pose) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listInLocal =  prefs.getStringList('playlistOfPoses');
    if(listInLocal == null){
      listInLocal = [];
    }

    listInLocal.add(JsonEncoder().convert(pose.toJson()));
    prefs.setStringList('playlistOfPoses', listInLocal);
  }

  static Future<bool> isPoseInPlaylist(Document pose) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listInLocal =  prefs.getStringList('playlistOfPoses');
    if(listInLocal == null){
      listInLocal = [];
    }
    for(String poseItem in listInLocal){
      var poseAsString = JsonEncoder().convert(pose.toJson());
      if(poseAsString == poseItem){
        return true;
      }
    }
    return false;
  }

  static removePoseFromPlaylistOfPoses(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listInLocal =  prefs.getStringList('playlistOfPoses');
    listInLocal.removeAt(index);
    prefs.setStringList('playlistOfPoses', listInLocal);
  }

}