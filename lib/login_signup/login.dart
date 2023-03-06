import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/colors/colors.dart';
import 'package:nss_jmieti/login_signup/cards/card_widget.dart';
import 'package:nss_jmieti/login_signup/signup.dart';

class signinScreen extends StatelessWidget {
  const signinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nssBlueColor,
      // 303983
      body: SafeArea(
        //child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                // padding from inside the box
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                height: 430,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5), // changes position of shadow
                      blurRadius: 3, // changes size of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  // /border: Border.all(color: Colors.black),
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
                        Text('Log In',
                            style:
                                TextStyle(color: nssBlueColor, fontSize: 30.0)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Already a User? Log In Now!',
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
                                borderRadius: BorderRadius.circular(30)),
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
                                borderRadius: BorderRadius.circular(30)),
                            labelText: 'Password',
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
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget Password',
                            style: TextStyle(color: nssBlueColor),
                          ),
                        ),
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
                                'Sign In',
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
                                Text('New User? '),
                                GestureDetector(
                                    onTap: () {
                                      signupScreen();
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signupScreen()));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(color: primaryred),
                                      ),
                                    ))
                              ]),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ]),
        //),
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
