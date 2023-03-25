import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/colors/colors.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:ourads/ourads.dart';
//import 'package:image_picker/image_picker.dart';

class feedPosts extends StatefulWidget {
  const feedPosts({super.key});

  @override
  State<feedPosts> createState() => _feedPostsState();
}

class _feedPostsState extends State<feedPosts> {
  @override
  Widget build(BuildContext context) {
    return
        // all posts in which likes, comment, photo, images, text posts
        Container(
      height: 500,
      decoration: BoxDecoration(
        border:
            Border.symmetric(horizontal: BorderSide(width: 10, color: backgnd)),
      ),
      child: Column(children: [
        //user id logo
        //user id name
        //user id title
        //user if desc
        //user id image
        //user like / dislike
        //user comment
      ]),
    );
  }
}
