import 'package:api/features/posts/api/post_service.dart';
import 'package:api/features/posts/models/post_model.dart';
import 'package:flutter/material.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();

    futurePosts = PostService().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Blog Posts")),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, jsonData) {
          if (jsonData.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
          } else if (jsonData.hasError) {
            return Center(child: Text("Error ${jsonData.error}"));
          } else if (jsonData.hasData) {
            final posts = jsonData.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${post.id}")),
                    title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}
