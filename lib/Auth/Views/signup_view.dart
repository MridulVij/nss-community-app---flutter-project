import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/colors/colors.dart';
import 'package:nss_jmieti/UI/colors/colors.dart';
import 'package:nss_jmieti/main.dart';
import 'package:get/get.dart';
import 'package:nss_jmieti/UI/bottom_bar/home.dart';
import 'package:nss_jmieti/Auth/Views/login_view.dart';
import 'package:nss_jmieti/Auth/Views/cards%20ui/card_widget.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://nssjmieti.onrender.com/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _mobileController.text,
        'password': _passwordController.text,
        'cpassword': _rePasswordController.text,
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
            title: Text('Registration Successful'),
            content: Text('Your account has been created successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Get.to(homePage());
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
            title: Text('Verify Email Account!'),
            content: Text(
                'Please open gmail app with same Email ID & verify your account!'),
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

  /// Teacher / Student Buttons
  void updateColor(int click) {
    if (click == 1) {}
  }

  ///

  @override
  Widget build(BuildContext context) {
    var valuetaker;

    return Scaffold(
      backgroundColor: nssBlueColor,
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
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
                          //custom height
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
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.grey[200],
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50.0,
                                      color: txtColor,
                                    ),
                                  ),
                                  Text('Sign Up',
                                      style: TextStyle(
                                          color: nssBlueColor, fontSize: 30.0)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('New User? Sign Up Now!',
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            print('clicked student');
                                            updateColor(1);
                                          });
                                        },
                                        child: Button(
                                            color: cardColor,
                                            txt: 'Student',
                                            width: 120),
                                      ),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            print('clicked teacher');
                                            updateColor(2);
                                          });
                                        },
                                        child: Button(
                                            color: cardColor,
                                            txt: 'Teacher',
                                            width: 120),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _nameController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Name',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
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
                                    controller: _mobileController,
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
                                  TextFormField(
                                    controller: _rePasswordController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Re-Enter Password',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please re - enter your password';
                                      } else if (valuetaker == value) {
                                        return null;
                                      } else {}
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
                                            _register();
                                          }
                                        },
                                        minWidth: double.maxFinite,
                                        height: 50.0,
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
                                  Text('OR', style: TextStyle(color: txtColor)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Already a User? ',
                                              style:
                                                  TextStyle(color: txtColor)),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(LoginPage());
                                            },
                                            child: Text(
                                              'Log In',
                                              style: TextStyle(
                                                  color: nssBlueColor),
                                            ),
                                          ),
                                        ]),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
