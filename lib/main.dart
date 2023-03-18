import 'package:flutter/material.dart';
import 'package:nss_jmieti/screens/home.dart';
import 'package:nss_jmieti/screens/notifications.dart';
//import 'package:nss_jmieti/screens/post.dart';
//import 'package:images_picker/images_picker.dart';
import 'package:nss_jmieti/screens/profile.dart';
import 'screens/home.dart';
import 'colors/colors.dart';
import 'login_signup/login.dart';
import 'login_signup/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: nssBlueColor)),
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: spareScreen(),
      //spareScreen(),
    );
  }
}

// Spare Screen
class spareScreen extends StatefulWidget {
  const spareScreen({super.key});

  @override
  State<spareScreen> createState() => _spareScreenState();
}

class _spareScreenState extends State<spareScreen> {
  int myIndex = 0;
  List<Widget> widgetList = [
    homePage(),
    postBar(),
    notificationsScreen(),
    profileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        backgroundColor: whitetext,
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class postBar extends StatefulWidget {
  const postBar({super.key});

  @override
  State<postBar> createState() => _postBarState();
}

class _postBarState extends State<postBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 1000,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }
}
