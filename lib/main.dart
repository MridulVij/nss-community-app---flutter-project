import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nss_jmieti/src/views/home/home/home.dart';
import 'package:nss_jmieti/src/views/home/profile/profile.dart';
import 'src/constants/colors.dart';
import 'src/views/home/notifications/notifications.dart';
import 'src/views/home/post/create_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final nss1BlueColor = Color.fromRGBO(48, 57, 131, 1);
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: nssBlueColor,
              primary: nssBlueColor,
              secondary: backgnd)),
      debugShowCheckedModeBanner: false,
      title: 'NSS Community',
      home: const spareScreen(),
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
    // Indexing of bottombar
    const homePage(),
    const MyPage(),
    const WebViewScreen(),
    const profileScreen(),
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
        items: const [
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
