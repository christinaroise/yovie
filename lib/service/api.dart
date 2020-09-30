import 'package:http/http.dart' as http;
import 'package:yovie_app/models/pose.dart';
import 'dart:convert';

class ApiService {

  Future<Pose> fetchData(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Pose.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  //   String PosesData = "https://firestore.googleapis.com/v1/projects/yovie-2c370/databases/(default)/documents/poses/";
}