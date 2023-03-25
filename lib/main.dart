//import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/bottom_bar/home.dart';
import 'package:nss_jmieti/UI/bottom_bar/notifications.dart';
import 'package:nss_jmieti/UI/bottom_bar/profile.dart';
//import 'package:video_player/video_player.dart';
import 'UI/bottom_bar/home.dart';
import 'UI/colors/colors.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

/////
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//   runApp(MyApp(isLoggedIn));
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;

//   MyApp(this.isLoggedIn);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme:
//           ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: nssBlueColor)),
//       debugShowCheckedModeBanner: false,
//       title: 'Home',
//       home: isLoggedIn ? spareScreen() : LoginPage(),
//     );
//   }
// }
/////

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: nssBlueColor)),
      debugShowCheckedModeBanner: false,
      title: 'NSS Community',
      home: spareScreen(),
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
    homePage(),
    homePage(),

    //MyPage(),
    //PostMediaPage(),
    //notificationsScreen(),
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

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   TextEditingController _textEditingController = TextEditingController();
//   File? _image;
//   File? _video;

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _pickVideo() async {
//     final pickedFile =
//         await ImagePicker().pickVideo(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _video = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _post() async {
//     final text = _textEditingController.text;

//     // Send the text, image, and video to the backend API
//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('https://your-backend-api.com/post'),
//     );
//     request.fields['text'] = text;
//     if (_image != null) {
//       request.files.add(
//         await http.MultipartFile.fromPath('image', _image!.path),
//       );
//     }
//     if (_video != null) {
//       request.files.add(
//         await http.MultipartFile.fromPath('video', _video!.path),
//       );
//     }

//     final response = await request.send();

//     if (response.statusCode == 200) {
//       // Post uploaded successfully
//     } else {
//       // Handle the error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     TextField(
//                       controller: _textEditingController,
//                       maxLines: null,
//                       decoration: InputDecoration(
//                         hintText: 'Enter your post text here...',
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: _pickImage,
//                       child: Text('Pick Image'),
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: _pickVideo,
//                       child: Text('Pick Video'),
//                     ),
//                     SizedBox(height: 16),
//                     _image != null ? Image.file(_image!) : SizedBox.shrink(),
//                     SizedBox(height: 16),
//                     if (_video != null)
//                       SizedBox(
//                         height: 200,
//                         // child: VideoPlayer(_video!),
//                       )
//                     else
//                       SizedBox.shrink(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _post,
//             child: Text('Post'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // post bar

// class PostMediaPage extends StatefulWidget {
//   @override
//   _PostMediaPageState createState() => _PostMediaPageState();
// }

// class _PostMediaPageState extends State<PostMediaPage> {
//   File? _mediaFile;
//   final picker = ImagePicker();

//   Future _pickMedia(ImageSource source) async {
//     final pickedFile = await picker.pickVideo(
//         source: source, maxDuration: const Duration(seconds: 30));
//     setState(() {
//       _mediaFile = File(pickedFile!.path);
//     });
//   }

//   Future _postMedia() async {
//     // Video api
//     final url = Uri.parse('https://your-backend-api-url.com/post-media');
//     final request = http.MultipartRequest('POST', url)
//       ..files.add(await http.MultipartFile.fromPath('media', _mediaFile!.path));
//     final response = await request.send();
//     if (response.statusCode == 200) {
//       // Media was successfully posted to the backend API.
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Media posted successfully'),
//       ));
//     } else {
//       // Error occurred while posting media to the backend API.
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error posting media'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post Media'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: _mediaFile == null
//                 ? Text('No media selected')
//                 : SizedBox(
//                     height: 300.0,
//                     child: Image.file(_mediaFile!),
//                   ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () => _pickMedia(ImageSource.gallery),
//                 child: Text('Select Video'),
//               ),
//               ElevatedButton(
//                 onPressed: _mediaFile == null ? null : _postMedia,
//                 child: Text('Post Media'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// //import 'dart:io';

// //import 'package:flutter/material.dart';
// //import 'package:http/http.dart' as http;

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   File? _image;

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });

//       // Send the image to the backend API
//       final response = await http.post(
//         Uri.parse('https://your-backend-api.com/upload-image'),
//         body: {
//           'file': await http.MultipartFile.fromPath('file', _image!.path),
//         },
//       );

//       if (response.statusCode == 200) {
//         // Image uploaded successfully
//       } else {
//         // Handle the error
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null ? Text('No image selected.') : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
