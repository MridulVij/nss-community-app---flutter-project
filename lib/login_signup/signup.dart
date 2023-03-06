import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/home.dart';
import 'package:nss_jmieti/login_signup/login.dart';
import 'package:nss_jmieti/login_signup/cards/card_widget.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nssBlueColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    //children: [Colo],
                    ),
                Container(
                  margin: EdgeInsets.all(20),
                  // padding from inside the box
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  height: 650,
                  width: 350,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5), // changes position of shadow
                        blurRadius: 3, // changes size of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    //border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //   child: Text(
                      //     'Join NSS',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      Container(
                        child: Column(children: <Widget>[
                          // Image.asset('assets/front_screen/nss.png',
                          //     height: 70.0, width: 70.0),
                          Icon(Icons.account_circle, size: 70.0),
                          Text('Sign Up',
                              style: TextStyle(
                                  color: nssBlueColor, fontSize: 30.0)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('New User? Sign Up Now!',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 15.0)),
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
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Mobile No.',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Re-Enter Password',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Text(
                          //     'Forget Password',
                          //     style: TextStyle(color: secondaryblue),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Material(
                              color: nssBlueColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  //Implement login functionality.
                                },
                                minWidth: 120.0,
                                height: 42.0,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Text('Forget Password'),
                          // ),

                          Text('OR'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already a User? '),
                                  // initialRoute: '/',
                                  // routes: {
                                  //   // When navigating to the "/" route, build the FirstScreen widget.
                                  //   '/': (context) => const FirstScreen(),
                                  //   // When navigating to the "/second" route, build the SecondScreen widget.
                                  //   '/second': (context) => const SecondScreen(),
                                  // },

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  signinScreen()));
                                    },
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(color: primaryred),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => homePage()));
                          },
                          child: Container(
                              height: 21,
                              width: 39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Color.fromARGB(123, 15, 12, 78),
                              ),
                              child: Center(
                                child: Text(' Skip ',
                                    style: TextStyle(color: whitetext)),
                              ))),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

//  Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 2, vertical: 1),
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             border: UnderlineInputBorder(),
//                             labelText: 'Re-Enter Password',
//                           ),
//                         ),
//                       ),


// Container(
                
//                 margin: EdgeInsets.all(20),
//                 // padding from inside the box
//                 padding:
//                     EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
//                 height: 430,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: secondaryblue,
//                       offset: Offset(0, 0), // changes position of shadow
//                       blurRadius: 4, // changes size of shadow
//                     ),
//                   ],
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   //border: Border.all(color: Colors.grey),
//                 ),
//                 child: Column(
//                   children: <Widget>[
//                     // Container(
//                     //   child: Text(
//                     //     'Join NSS',
//                     //     style: TextStyle(color: Colors.white),
//                     //   ),
//                     // ),
//                     Container(
//                       child: Column(children: <Widget>[
//                         Image.asset('assets/front_screen/nss.png',
//                             height: 70.0, width: 70.0),
//                         Text('Sign In',
//                             style: TextStyle(
//                                 color: secondaryblue, fontSize: 30.0)),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('Please enter your Email and Password',
//                             style: TextStyle(
//                                 color: Colors.grey[800], fontSize: 10.0)),
//                       ]),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                         child: Column(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Email',
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Password',
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     )),
//                     Container(
//                         child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {},
//                           child: Text(
//                             'Forget Password',
//                             style: TextStyle(color: secondaryblue),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10.0),
//                           child: Material(
//                             color: secondaryblue,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(30.0)),
//                             elevation: 0.0,
//                             child: MaterialButton(
//                               onPressed: () {
//                                 //Implement login functionality.
//                               },
//                               minWidth: 120.0,
//                               height: 42.0,
//                               child: Text(
//                                 'Sign In',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         // GestureDetector(
//                         //   onTap: () {},
//                         //   child: Text('Forget Password'),
//                         // ),

//                         Text('OR'),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('New User? '),
//                                 GestureDetector(
//                                     onTap: () {},
//                                     child: Text(
//                                       'Sign Up',
//                                       style: TextStyle(color: secondaryblue),
//                                     ))
//                               ]),
//                         )
//                       ],
//                     ))
//                   ],
//                 ),
//               ),