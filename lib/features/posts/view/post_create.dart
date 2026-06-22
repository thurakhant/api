import 'package:api/features/posts/api/post_service.dart';
import 'package:flutter/material.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({super.key});

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Enter Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Enter Body'),
            ),

            ElevatedButton(
              onPressed: () {
                PostService().sendDataToServer(titleController.text, bodyController.text);
                titleController.clear();
                bodyController.clear();
              },
              child: Text("Post to Newfeed"),
            ),
          ],
        ),
      ),
    );
  }
}
