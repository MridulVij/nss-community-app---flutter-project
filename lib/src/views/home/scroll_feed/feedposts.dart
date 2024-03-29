import 'package:flutter/material.dart';
import 'package:nss_jmieti/src/constants/colors.dart';
import 'package:share_plus/share_plus.dart';

class feedPosts extends StatefulWidget {
  const feedPosts({super.key});

  @override
  State<feedPosts> createState() => _feedPostsState();
}

class _feedPostsState extends State<feedPosts> {
  final usernameText = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  final headLineText = const TextStyle(fontSize: 15, color: txtColor);

  ///
  ///final username = Data().userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              BorderDirectional(bottom: BorderSide(width: 10, color: backgnd))),
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const CircleAvatar(
                radius: 26,
                backgroundColor: backgnd,
              ),
              const SizedBox(width: 10),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //child:
                    Text(
                      "Mridul Vij",
                      style: usernameText,
                      //textAlign: TextAlign.left,
                    ),
                    // ),
                    Text(
                      'Teacher',
                      style: headLineText,
                      //textAlign: TextAlign.left,
                    ),
                    const Text('Sec ago',
                        style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(225, 0, 0, 0),
                child: GestureDetector(
                  child: const Icon(
                    Icons.more_vert,
                    size: 25,
                    color: gry,
                  ),
                  onTap: () {},
                ),
              )
            ])),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
              style: TextStyle(color: textblack)),
        ),

        Container(
          color: backgnd,
          height: 400,
          width: 400,
          //child: Image.asset('assets/mayank.jpg')
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print('liked');
                      });
                    },
                    child: Container(
                        // margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        // child: Image.asset(
                        //   'assets/dislike2.png',
                        //   width: 28,
                        //   color: gry,
                        // ),
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => comments(
                                    username: 'UserName',
                                    timing: 'November 31',
                                    commenttext:
                                        'dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text jsdfb sf sfdhfhsf  fsd f sd g sjfhs  f sfuhfhsfhf  f ffh sfhk f  f h fh f fh sdkf ha f f fu yf uif;ifh 8yruf f f fu uil ',
                                  )));
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: const Icon(
                          Icons.mode_comment_outlined,
                          size: 28,
                          color: gry,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                          "Hi, I Created my Post on NSS JMIETI\n\nJoin Now NSS Community\nRegister here: https://nssjmieti.netlify.app/register \n\tor\nDownload the Nss Community App Now: https://creatifyappsstore.blogspot.com/2023/03/nss-community-app.html");
                    },
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                        child: const Icon(
                          Icons.share_outlined,
                          size: 28,
                          color: gry,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(width: 5),
                  Text('9999 likes',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, color: textblack)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text('9999 Comments',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 13, color: textblack)),
                  )
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

// like , dislike, comment , share button
class lscButton extends StatelessWidget {
  const lscButton(this.like, this.dislike, this.comments, this.share,
      this.margin, this.icon,
      {super.key});
  final like;
  final dislike;
  final comments;
  final share;
  final margin;
  final icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.fromLTRB(250, 0, 0, 0),
          child: const Icon(
            Icons.share_outlined,
            size: 28,
            color: gry,
          )),
    );
  }
}

// comments info username, timing, commenttext
class comments extends StatelessWidget {
  //const comments({super.key});
  comments({this.username, this.timing, this.commenttext});
  final username;
  final timing;
  final commenttext;

  @override
  Widget build(BuildContext context) {
    const _userTextStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textblack);
    const _commentTextStyle = TextStyle(
        fontSize: 15, fontWeight: FontWeight.normal, color: textblack);
    const _timingTextstyle =
        TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: gry);
    return Scaffold(
      appBar: AppBar(title: const Text('Comments'), elevation: 0.0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 310,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Add a Comment',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: backgnd),
                    child: const Center(child: Icon(Icons.send)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text('Latest Comments', style: _timingTextstyle),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(username, style: _userTextStyle),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(timing, style: _timingTextstyle),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 5, 0),
                          child: Text(commenttext, style: _commentTextStyle),
                        )
                      ],
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
