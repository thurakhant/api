import 'dart:convert';

import 'package:api/features/posts/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  final String url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<PhotoModel>> getPhoto() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);

      List<PhotoModel> photos = body.map((photo) => PhotoModel.fromJson(photo)).toList();

      return photos;
    } else {
      throw Exception("Failed to fetch");
    }
  }
}
