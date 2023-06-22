import 'package:dio_flutter/main.dart';
import 'package:dio_flutter/post_entity.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          TextField(),
          SizedBox(height: 10),
          TextField(),
          ElevatedButton(
              onPressed: () async {
               final result =  await createPostDetail();
                Navigator.pop(context,result);
              },
              child: Text('Submit'))
        ],
      ),
    );
  }

  Future createPostDetail() async {
    await Future.delayed(const Duration(seconds: 2));
    final posts = await client.createPost(new PostEntity(userId: 2,title: "Toppic Flutter",body: "Using library dio"));
    return posts;
  }
}
