import 'package:flutter/material.dart';

class feedPosts extends StatefulWidget {
  const feedPosts({super.key});

  @override
  State<feedPosts> createState() => _feedPostsState();
}

class _feedPostsState extends State<feedPosts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // all posts in which likes, comment, photo, images, text posts
        ],
      ),
    );
  }
}
