import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  Future<dynamic> fetchData(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  //   String PosesData = "https://firestore.googleapis.com/v1/projects/yovie-2c370/databases/(default)/documents/poses/";
}