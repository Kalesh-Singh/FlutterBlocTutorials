import 'package:flutter/material.dart';
import 'package:infinitelistapp/data/posts/models/post_model.dart';

class PostTile extends StatelessWidget {
  final PostModel post;

  const PostTile({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
