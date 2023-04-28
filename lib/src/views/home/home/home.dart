//DashBoard for NSS
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:nss_jmieti/src/views/home/sidebar/other/sidebar.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int myIndex = 0;
  List<dynamic> users = [];
  void fetchusers() async {
    const url = 'https://nssjmieti.onrender.com/post/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print("fetchUsers Completed");
    print(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const sideBar(),
        backgroundColor: whitetext,
        appBar: AppBar(
          //feed post title
          // actions: [
          // Container(
          //   margin: const EdgeInsets.fromLTRB(0, 0, 60, 0),
          //   padding: const EdgeInsets.fromLTRB(80, 10, 90, 0),
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: const [
          //             // image of logo
          //           ],
          //         ),
          //         Center(
          //           child: Container(
          //             child: const Text('National Service Scheme',
          //                 style: TextStyle(fontSize: 11)),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          //],
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              //
            }));
  }
}
