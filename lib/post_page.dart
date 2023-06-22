import 'package:dio_flutter/create_edit_post_page.dart';
import 'package:dio_flutter/post_detail_page.dart';
import 'package:dio_flutter/post_entity.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostEntity> posts = [];

  @override
  void initState() {
    getPostAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title ?? ''),
            subtitle: Text(post.body ??''),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deletePostAPI(post.id ?? 0);
              },
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PostDetailPage(id: post.id ?? 0)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
      final result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreatePostPage()));
      posts.add(result);
      setState(() {
      });
      }, child: Icon(Icons.add),),
    );
  }

  void getPostAPI() async {
    final posts = await client.getPosts();

    setState(() {
      this.posts = posts;
    });
  }

  void deletePostAPI(int id) async {
    await client.deletePost(id);

    setState(() {
      posts.removeWhere((element) => element.id == id);
    });
  }
}
