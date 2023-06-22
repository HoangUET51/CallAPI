import 'package:dio_flutter/post_entity.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostEntity? postEntity;

  @override
  void initState() {
    getPostDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post detail'),
      ),
      body: postEntity == null
          ? const Center(child:  CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 50),
                Text(postEntity?.title ?? '',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20)),
                const SizedBox(height: 20),
                Text(postEntity?.body ?? ''),
              ],
            ),
    );
  }

  void getPostDetail() async {
    await Future.delayed(const Duration(seconds: 2));
    final posts = await client.getPostDetail(widget.id);

    setState(() {
      postEntity = posts;
    });
  }
}
