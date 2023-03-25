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
  final usernameText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  final headLineText = TextStyle(fontSize: 15, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.symmetric(horizontal: BorderSide(width: 10, color: backgnd)),
      ),
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: backgnd,
              ),
              SizedBox(width: 10),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    'mridul luli',
                    style: usernameText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                  child: Text(
                    'Student',
                    style: headLineText,
                  ),
                ),
                Text('Sec ago', style: headLineText),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(210, 0, 0, 0),
                child: GestureDetector(
                  child: Icon(
                    Icons.more_vert,
                    size: 25,
                    color: gry,
                  ),
                  onTap: () {},
                ),
              )
            ])),

        Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
            style: TextStyle(color: textblack)),

        Container(height: 350, child: Image.asset('assets/mridul.jpg')),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Image.asset(
                      'assets/dislike2.png',
                      height: 25,
                      width: 25,
                      color: gry,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.mode_comment_outlined,
                        size: 25,
                        color: gry,
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                      child: Icon(
                        Icons.share_outlined,
                        size: 25,
                        color: gry,
                      ))
                ],
              ),
              Row(
                children: [
                  Text('10M likes',
                      style: TextStyle(fontSize: 15, color: textblack))
                ],
              )
            ],
          ),
        ),
        //user id logo
        //user id name
        //user id title
        //user if desc
        //user id image
        //user like / dislike
        //user comment
      ]),
    );
    //);
  }
}
