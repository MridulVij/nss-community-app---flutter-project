import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/login_signup/signup.dart';
import 'package:nss_jmieti/main.dart';
import 'package:nss_jmieti/screens/home.dart';
import 'package:nss_jmieti/login_signup/login.dart';
import 'package:nss_jmieti/login_signup/cards/card_widget.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _rePasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://nssjmieti.onrender.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // 'name': _nameController.text,
        'email': _emailController.text,
        // 'phone': _mobileController.text,
        'password': _passwordController.text,
        // 'cpassword': _rePasswordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // registration successful, display success message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Successfully'),
            content: Text('Email ID & Password is Correct!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => spareScreen()));
                },
              ),
            ],
          );
        },
      );
    } else {
      // registration failed, display error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Crendentials Failed!'),
            content: Text('Please Enter Correct Email ID & Password!'),
            // this app is for checking which type of response we recive from backend
            //Text(response.body),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var valuetaker;

    return Scaffold(
      backgroundColor: nssBlueColor,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: whitetext,
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          // padding from inside the box
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          height: 420,
                          width: 350,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset:
                                    Offset(5, 5), // changes position of shadow
                                blurRadius: 3, // changes size of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            //border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    size: 70.0,
                                    color: txtColor,
                                  ),
                                  Text('Log In',
                                      style: TextStyle(
                                          color: nssBlueColor, fontSize: 30.0)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Already a User? Login Now!',
                                      style: TextStyle(
                                          color: txtColor, fontSize: 15.0)),
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _emailController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Email',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Password',
                                    ),
                                    validator: (value1) {
                                      valuetaker = value1;
                                      if (value1 == null || value1.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Material(
                                      color: nssBlueColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      elevation: 0.0,
                                      child: MaterialButton(
                                        onPressed: () {
                                          //Implement signup functionality.
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _login();
                                          }
                                        },
                                        minWidth: double.maxFinite,
                                        height: 50.0,
                                        child: Text(
                                          'Log in',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('OR', style: TextStyle(color: txtColor)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('New User? ',
                                              style:
                                                  TextStyle(color: txtColor)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegistrationPage()));
                                            },
                                            child: Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  color: nssBlueColor),
                                            ),
                                          ),
                                        ]),
                                  )
                                ],
                              )),

                              // GestureDetector(
                              //     onTap: () {
                              //       Navigator.of(context).push(
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   spareScreen()));
                              //     },
                              //     child: Container(
                              //         height: 21,
                              //         width: 39,
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(13),
                              //           color: Color.fromARGB(123, 15, 12, 78),
                              //         ),
                              //         child: Center(
                              //           child: Text(' Skip ',
                              //               style: TextStyle(color: whitetext)),
                              //         ))),
                            ],
                          ),
                        ),
                      ]),
                  // Original Base UI with backend
                  // Column( // all ui here
                  //   children: <Widget>[
                  //     SizedBox(height: 20),
                  //     Text(
                  //       'Registration',
                  //       style: TextStyle(fontSize: 24),
                  //     ),
                  //     SizedBox(height: 20),
                  //     TextFormField(
                  //       controller: _nameController,
                  //       decoration: InputDecoration(
                  //         labelText: 'Name',
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       validator: (value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Please enter your name';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //     SizedBox(height: 10),
                  //     TextFormField(
                  //       controller: _emailController,
                  //       keyboardType: TextInputType.emailAddress,
                  //       decoration: InputDecoration(
                  //         labelText: 'Email',
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       validator: (value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Please enter your email';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //     SizedBox(height: 10),
                  //     TextFormField(
                  //       controller: _mobileController,
                  //       keyboardType: TextInputType.phone,
                  //       decoration: InputDecoration(
                  //         labelText: 'Mobile No.',
                  //         border: OutlineInputBorder(),
                  //       ),
                  //     ),

                  //     SizedBox(height: 10),

                  //     TextFormField(
                  //       controller: _passwordController,
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         labelText: 'Password',
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       validator: (value1) {
                  //         valuetaker = value1;
                  //         if (value1 == null || value1.isEmpty) {
                  //           return 'Please enter your password';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //     //
                  //     SizedBox(height: 10),
                  //     TextFormField(
                  //       controller: _rePasswordController,
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         labelText: 'Re - Enter Password',
                  //         border: OutlineInputBorder(),
                  //       ),
                  //       validator: (value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Please re - enter your password';
                  //         } else if (valuetaker == value) {
                  //           return null;
                  //         } else {}
                  //       },
                  //     ),
                  //     SizedBox(height: 20),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         if (_formKey.currentState!.validate()) {
                  //           _register();
                  //         }
                  //       },
                  //       child: Text('Register'),
                  //     ),
                  //     //
                  //   ],
                  // ),
                ),
              ),
            ),
    );
  }
}




// Original  UI without Backend

// var txtColor = Colors.grey[700];

// class signupScreen extends StatelessWidget {
//   const signupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: nssBlueColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                     //children: [Colo],
//                     ),
//                 Container(
//                   margin: EdgeInsets.all(20),
//                   // padding from inside the box
//                   padding:
//                       EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
//                   height: 650,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     //borderRadius: BorderRadius.circular(40),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         offset: Offset(5, 5), // changes position of shadow
//                         blurRadius: 3, // changes size of shadow
//                       ),
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(40),
//                     //border: Border.all(color: Colors.grey),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       // Container(
//                       //   child: Text(
//                       //     'Join NSS',
//                       //     style: TextStyle(color: Colors.white),
//                       //   ),
//                       // ),
//                       Container(
//                         child: Column(children: <Widget>[
//                           // Image.asset('assets/front_screen/nss.png',
//                           //     height: 70.0, width: 70.0),
//                           Icon(
//                             Icons.account_circle,
//                             size: 70.0,
//                             color: txtColor,
//                           ),
//                           Text('Sign Up',
//                               style: TextStyle(
//                                   color: nssBlueColor, fontSize: 30.0)),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('New User? Sign Up Now!',
//                               style:
//                                   TextStyle(color: txtColor, fontSize: 15.0)),
//                         ]),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                           child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               labelText: 'Name',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               labelText: 'Email',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               labelText: 'Mobile No.',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               labelText: 'Password',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               labelText: 'Re-Enter Password',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       )),
//                       Container(
//                           child: Column(
//                         children: [
//                           // GestureDetector(
//                           //   onTap: () {},
//                           //   child: Text(
//                           //     'Forget Password',
//                           //     style: TextStyle(color: secondaryblue),
//                           //   ),
//                           // ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10.0),
//                             child: Material(
//                               color: nssBlueColor,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                               elevation: 0.0,
//                               child: MaterialButton(
//                                 onPressed: () {
//                                   //Implement login functionality.
//                                 },
//                                 minWidth: double.maxFinite,
//                                 height: 50.0,
//                                 child: Text(
//                                   'Sign Up',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           // GestureDetector(
//                           //   onTap: () {},
//                           //   child: Text('Forget Password'),
//                           // ),

//                           Text('OR', style: TextStyle(color: txtColor)),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('Already a User? ',
//                                       style: TextStyle(color: txtColor)),
//                                   // initialRoute: '/',
//                                   // routes: {
//                                   //   // When navigating to the "/" route, build the FirstScreen widget.
//                                   //   '/': (context) => const FirstScreen(),
//                                   //   // When navigating to the "/second" route, build the SecondScreen widget.
//                                   //   '/second': (context) => const SecondScreen(),
//                                   // },

//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   signinScreen()));
//                                     },
//                                     child: Text(
//                                       'Log In',
//                                       style: TextStyle(color: nssBlueColor),
//                                     ),
//                                   ),
//                                 ]),
//                           )
//                         ],
//                       )),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => spareScreen()));
//                           },
//                           child: Container(
//                               height: 21,
//                               width: 39,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(13),
//                                 color: Color.fromARGB(123, 15, 12, 78),
//                               ),
//                               child: Center(
//                                 child: Text(' Skip ',
//                                     style: TextStyle(color: whitetext)),
//                               ))),
//                     ],
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// //import 'package:new_login_signup_chatgpt/home.dart';
// import 'package:nss_jmieti/login_signup/signup.dart';

// import '../colors/colors.dart';
// import '../screens/home.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await http.post(
//       Uri.parse('https://nssjmieti.onrender.com/login'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       // login successful, navigate to home page
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => homePage()));
//     } else {
//       // login failed, display error message
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Login Error'),
//             content: Text(response.body),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: nssBlueColor,
//         // 303983
//         body: SafeArea(
//           //child: Container(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(20),
//                   // padding from inside the box
//                   padding:
//                       EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
//                   height: 430,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         offset: Offset(5, 5), // changes position of shadow
//                         blurRadius: 3, // changes size of shadow
//                       ),
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(40),
//                     // /border: Border.all(color: Colors.black),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         child: Column(children: <Widget>[
//                           // Image.asset('assets/front_screen/nss.png',
//                           //     height: 70.0, width: 70.0),
//                           Icon(
//                             Icons.account_circle,
//                             size: 70.0,
//                             color: txtColor,
//                           ),
//                           Text('Log In',
//                               style: TextStyle(
//                                   color: nssBlueColor, fontSize: 30.0)),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Already a User? Log In Now!',
//                               style:
//                                   TextStyle(color: txtColor, fontSize: 15.0)),
//                         ]),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                           child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: _emailController,
//                             //autofocus: false,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30)),
//                               labelText: 'Email',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: _passwordController,
//                            // autofocus: false,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30)),
//                               labelText: 'Password',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       )),
//                       Container(
//                           child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {},
//                             child: Text(
//                               'Forget Password',
//                               style: TextStyle(color: nssBlueColor),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10.0),
//                             child: Material(
//                               color: nssBlueColor,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                               elevation: 0.0,
//                               child: MaterialButton(
//                                 onPressed: () {
//                                   //Implement login functionality.
//                                   if (_formKey.currentState!.validate()) {
//                                     _login();
//                                   }
//                                 },
//                                 minWidth: double.maxFinite,
//                                 height: 50.0,
//                                 child: Text(
//                                   'Sign In',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('OR', style: TextStyle(color: txtColor)),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('New User? ',
//                                       style: TextStyle(color: txtColor)),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context)
//                                           .push(MaterialPageRoute(
//                                               builder: (context) =>
//                                                   // chek here
//                                                   RegistrationPage()));
//                                     },
//                                     child: Text(
//                                       'Sign Up',
//                                       style: TextStyle(color: nssBlueColor),
//                                     ),
//                                   ),
//                                 ]),
//                           ),
//                         ],
//                       ))
//                     ],
//                   ),
//                 ),
//               ]),
//         ));
//   }
// }


// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:nss_jmieti/login_signup/signup.dart';
// // import '../colors/colors.dart';
// // import '../screens/home.dart';
// // //import 'package:new_login_signup_chatgpt/home.dart';

// // class LoginPage extends StatefulWidget {
// //   @override
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();

// //   bool _isLoading = false;

// //   Future<void> _login() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     final response = await http.post(
// //       Uri.parse('https://nssjmieti.onrender.com/login'),
// //       headers: <String, String>{
// //         'Content-Type': 'application/json; charset=UTF-8',
// //       },
// //       body: jsonEncode(<String, String>{
// //         'email': _emailController.text,
// //         'password': _passwordController.text,
// //       }),
// //     );

// //     setState(() {
// //       _isLoading = false;
// //     });

// //     if (response.statusCode == 200) {
// //       // login successful, navigate to home page
// //       Navigator.of(context)
// //           .push(MaterialPageRoute(builder: (context) => homePage()));
// //     } else {
// //       // login failed, display error message
// //       showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             title: Text('Login Error'),
// //             content: Text(response.body),
// //             actions: <Widget>[
// //               TextButton(
// //                 child: Text('OK'),
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: nssBlueColor,
// //       // 303983
// //       body: SafeArea(
// //         //child: Container(
// //         child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: <Widget>[
// //               Container(
// //                 margin: EdgeInsets.all(20),
// //                 // padding from inside the box
// //                 padding:
// //                     EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
// //                 height: 430,
// //                 width: 350,
// //                 decoration: BoxDecoration(
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black,
// //                       offset: Offset(5, 5), // changes position of shadow
// //                       blurRadius: 3, // changes size of shadow
// //                     ),
// //                   ],
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(40),
// //                   // /border: Border.all(color: Colors.black),
// //                 ),
// //                 child: Column(
// //                   children: <Widget>[
// //                     Container(
// //                       child: Column(children: <Widget>[
// //                         // Image.asset('assets/front_screen/nss.png',
// //                         //     height: 70.0, width: 70.0),
// //                         Icon(
// //                           Icons.account_circle,
// //                           size: 70.0,
// //                           color: txtColor,
// //                         ),
// //                         Text('Log In',
// //                             style:
// //                                 TextStyle(color: nssBlueColor, fontSize: 30.0)),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         Text('Already a User? Log In Now!',
// //                             style: TextStyle(color: txtColor, fontSize: 15.0)),
// //                       ]),
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Container(
// //                         child: Column(
// //                       children: [
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         TextFormField(
// //                           controller: _emailController,
// //                           autofocus: false,
// //                           obscureText: false,
// //                           decoration: InputDecoration(
// //                             border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(30)),
// //                             labelText: 'Email',
// //                           ),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter your email';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         TextFormField(
// //                           controller: _passwordController,
// //                           autofocus: false,
// //                           obscureText: false,
// //                           decoration: InputDecoration(
// //                             border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(30)),
// //                             labelText: 'Password',
// //                           ),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter your password';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                       ],
// //                     )),
// //                     Container(
// //                         child: Column(
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () {},
// //                           child: Text(
// //                             'Forget Password',
// //                             style: TextStyle(color: nssBlueColor),
// //                           ),
// //                         ),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         Padding(
// //                           padding: EdgeInsets.symmetric(vertical: 10.0),
// //                           child: Material(
// //                             color: nssBlueColor,
// //                             borderRadius:
// //                                 BorderRadius.all(Radius.circular(30.0)),
// //                             elevation: 0.0,
// //                             child: MaterialButton(
// //                               onPressed: () {
// //                                 //Implement login functionality.
// //                                 if (_formKey.currentState!.validate()) {
// //                                   _login();
// //                                 }
// //                               },
// //                               minWidth: double.maxFinite,
// //                               height: 50.0,
// //                               child: Text(
// //                                 'Sign In',
// //                                 style: TextStyle(color: Colors.white),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(
// //                           height: 5,
// //                         ),
// //                         Text('OR', style: TextStyle(color: txtColor)),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         Container(
// //                           child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 Text('New User? ',
// //                                     style: TextStyle(color: txtColor)),
// //                                 GestureDetector(
// //                                   onTap: () {
// //                                     Navigator.of(context)
// //                                         .push(MaterialPageRoute(
// //                                             builder: (context) =>
// //                                                 // chek here
// //                                                 RegistrationPage()));
// //                                   },
// //                                   child: Text(
// //                                     'Sign Up',
// //                                     style: TextStyle(color: nssBlueColor),
// //                                   ),
// //                                 ),
// //                               ]),
// //                         ),
// //                       ],
// //                     ))
// //                   ],
// //                 ),
// //               ),
// //             ]),
// //         //),
// //       ),
// //     );
// //   }
// // }



// // // import 'dart:ui';
// // // import 'package:flutter/material.dart';
// // // import 'package:nss_jmieti/colors/colors.dart';
// // // import 'package:nss_jmieti/colors/colors.dart';
// // // import 'package:nss_jmieti/login_signup/cards/card_widget.dart';
// // // import 'package:nss_jmieti/login_signup/signup.dart';

// // // class signinScreen extends StatelessWidget {
// // //   const signinScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: nssBlueColor,
// // //       // 303983
// // //       body: SafeArea(
// // //         //child: Container(
// // //         child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: <Widget>[
// // //               Container(
// // //                 margin: EdgeInsets.all(20),
// // //                 // padding from inside the box
// // //                 padding:
// // //                     EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
// // //                 height: 430,
// // //                 width: 350,
// // //                 decoration: BoxDecoration(
// // //                   boxShadow: [
// // //                     BoxShadow(
// // //                       color: Colors.black,
// // //                       offset: Offset(5, 5), // changes position of shadow
// // //                       blurRadius: 3, // changes size of shadow
// // //                     ),
// // //                   ],
// // //                   color: Colors.white,
// // //                   borderRadius: BorderRadius.circular(40),
// // //                   // /border: Border.all(color: Colors.black),
// // //                 ),
// // //                 child: Column(
// // //                   children: <Widget>[
// // //                     // Container(
// // //                     //   child: Text(
// // //                     //     'Join NSS',
// // //                     //     style: TextStyle(color: Colors.white),
// // //                     //   ),
// // //                     // ),
// // //                     Container(
// // //                       child: Column(children: <Widget>[
// // //                         // Image.asset('assets/front_screen/nss.png',
// // //                         //     height: 70.0, width: 70.0),
// // //                         Icon(
// // //                           Icons.account_circle,
// // //                           size: 70.0,
// // //                           color: txtColor,
// // //                         ),
// // //                         Text('Log In',
// // //                             style:
// // //                                 TextStyle(color: nssBlueColor, fontSize: 30.0)),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         Text('Already a User? Log In Now!',
// // //                             style: TextStyle(color: txtColor, fontSize: 15.0)),
// // //                       ]),
// // //                     ),
// // //                     SizedBox(
// // //                       height: 10,
// // //                     ),
// // //                     Container(
// // //                         child: Column(
// // //                       children: [
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         TextField(
// // //                           autofocus: false,
// // //                           obscureText: false,
// // //                           decoration: InputDecoration(
// // //                             border: OutlineInputBorder(
// // //                                 borderRadius: BorderRadius.circular(30)),
// // //                             labelText: 'Email',
// // //                           ),
// // //                         ),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         TextField(
// // //                           autofocus: false,
// // //                           obscureText: false,
// // //                           decoration: InputDecoration(
// // //                             border: OutlineInputBorder(
// // //                                 borderRadius: BorderRadius.circular(30)),
// // //                             labelText: 'Password',
// // //                           ),
// // //                         ),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                       ],
// // //                     )),
// // //                     Container(
// // //                         child: Column(
// // //                       children: [
// // //                         // GestureDetector(
// // //                         //   onTap: () {},
// // //                         //   child: Text(
// // //                         //     'Forget Password',
// // //                         //     style: TextStyle(color: nssBlueColor),
// // //                         //   ),
// // //                         // ),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         Padding(
// // //                           padding: EdgeInsets.symmetric(vertical: 10.0),
// // //                           child: Material(
// // //                             color: nssBlueColor,
// // //                             borderRadius:
// // //                                 BorderRadius.all(Radius.circular(30.0)),
// // //                             elevation: 0.0,
// // //                             child: MaterialButton(
// // //                               onPressed: () {
// // //                                 //Implement login functionality.
// // //                               },
// // //                               minWidth: double.maxFinite,
// // //                               height: 50.0,
// // //                               child: Text(
// // //                                 'Sign In',
// // //                                 style: TextStyle(color: Colors.white),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         SizedBox(
// // //                           height: 5,
// // //                         ),
// // //                         // GestureDetector(
// // //                         //   onTap: () {},
// // //                         //   child: Text('Forget Password'),
// // //                         // ),

// // //                         Text('OR', style: TextStyle(color: txtColor)),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         Container(
// // //                           child: Row(
// // //                               mainAxisAlignment: MainAxisAlignment.center,
// // //                               children: [
// // //                                 Text('New User? ',
// // //                                     style: TextStyle(color: txtColor)),
// // //                                 GestureDetector(
// // //                                   onTap: () {
// // //                                     Navigator.of(context)
// // //                                         .push(MaterialPageRoute(
// // //                                             builder: (context) =>
// // //                                                 // chek here
// // //                                                 RegistrationPage()));
// // //                                   },
// // //                                   child: Text(
// // //                                     'Sign Up',
// // //                                     style: TextStyle(color: nssBlueColor),
// // //                                   ),
// // //                                 ),
// // //                               ]),
// // //                         )
// // //                       ],
// // //                     ))
// // //                   ],
// // //                 ),
// // //               ),
// // //             ]),
// // //         //),
// // //       ),
// // //     );
// // //   }
// // // }

// // // //  Padding(
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                             horizontal: 2, vertical: 1),
// // // //                         child: TextFormField(
// // // //                           decoration: const InputDecoration(
// // // //                             border: UnderlineInputBorder(),
// // // //                             labelText: 'Re-Enter Password',
// // // //                           ),
// // // //                         ),
// // // //                       ),
