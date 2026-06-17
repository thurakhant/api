import 'dart:convert';

import 'package:api/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  //
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw Exception("Failed to load from server");
    }
  }
}
