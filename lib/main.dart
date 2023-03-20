import 'package:flutter/material.dart';
import 'package:nss_jmieti/screens/home.dart';
import 'package:nss_jmieti/screens/notifications.dart';
import 'package:nss_jmieti/screens/profile.dart';
import 'screens/home.dart';
import 'colors/colors.dart';
import 'login_signup/login.dart';
import 'login_signup/signup.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
    PostMediaPage(),
    notificationsScreen(),
    profileScreen(),
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

// post bar

class PostMediaPage extends StatefulWidget {
  @override
  _PostMediaPageState createState() => _PostMediaPageState();
}

class _PostMediaPageState extends State<PostMediaPage> {
  File? _mediaFile;
  final picker = ImagePicker();

  Future _pickMedia(ImageSource source) async {
    final pickedFile = await picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 30));
    setState(() {
      _mediaFile = File(pickedFile!.path);
    });
  }

  Future _postMedia() async {
    // Video api
    final url = Uri.parse('https://your-backend-api-url.com/post-media');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('media', _mediaFile!.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      // Media was successfully posted to the backend API.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Media posted successfully'),
      ));
    } else {
      // Error occurred while posting media to the backend API.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error posting media'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Media'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: _mediaFile == null
                ? Text('No media selected')
                : SizedBox(
                    height: 300.0,
                    child: Image.file(_mediaFile!),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _pickMedia(ImageSource.gallery),
                child: Text('Select Video'),
              ),
              ElevatedButton(
                onPressed: _mediaFile == null ? null : _postMedia,
                child: Text('Post Media'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
