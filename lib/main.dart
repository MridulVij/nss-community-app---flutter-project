import 'package:flutter/material.dart';
import 'package:nss_jmieti/home.dart';
import 'home.dart';
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
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      home: signupScreen(),
    );
  }
}
// MaterialApp(
//   routes: <String, WidgetBuilder>{
//     '/': (BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Home Route'),
//         ),
//       );
//     },
//     '/about': (BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('About Route'),
//         ),
//       );
//     }
//   },
// );
//     MaterialApp(
//   debugShowCheckedModeBanner: false,
//   title: 'NSS JMIETI',
//   //theme: ThemeData(primaryColor: primaryred, accentColor: secondaryblue),
//   // Calling to Home page
//   home: homePage(),
// );
//   import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Named Routes Demo',
//       // Start the app with the "/" named route. In this case, the app starts
//       // on the FirstScreen widget.
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const FirstScreen(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => const SecondScreen(),
//       },
//     ),
//   );
// }

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           // Within the `FirstScreen` widget
//           onPressed: () {
//             // Navigate to the second screen using a named route.
//             Navigator.pushNamed(context, '/second');
//           },
//           child: const Text('Launch screen'),
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           // Within the SecondScreen widget
//           onPressed: () {
//             // Navigate back to the first screen by popping the current route
//             // off the stack.
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
