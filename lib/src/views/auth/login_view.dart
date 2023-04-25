import 'package:flutter/material.dart';
import 'package:nss_jmieti/src/constants/colors.dart';
import 'package:nss_jmieti/src/views/auth/signup_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      // String token = response["maintoken"];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //
            title: const Text('Login Successfully!'),
            content: const Text('Email ID & Password is Correct!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  // go to sparescreen
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
            title: const Text('Wrong Details! Try Again.'),
            content: const Text('Please Enter Correct Email ID & Password!'),
            // this app is for checking which type of response we recive from backend
            //Text(response.body),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
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
          ? const Center(
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
                          margin: const EdgeInsets.all(20),
                          // padding from inside the box
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          // height: 420,
                          // width: 350,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(40),
                            boxShadow: const [
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
                                child: Column(children: const <Widget>[
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
                              const SizedBox(
                                height: 10,
                              ),
                              // Teacher / Student Buttons
                              Container(
                                  child: Column(
                                children: [
                                  const SizedBox(
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
                                  const SizedBox(
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Material(
                                      color: nssBlueColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30.0)),
                                      elevation: 0.0,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          //Implement signup functionality.
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _login();
                                          }
                                          // final SharedPreferences
                                          //     sharedPreferences =
                                          //     await SharedPreferences
                                          //         .getInstance();
                                          // sharedPreferences.setString(
                                          //     'email', _emailController.text);
                                          // Get.to(spareScreen());
                                        },
                                        minWidth: double.maxFinite,
                                        height: 50.0,
                                        child: const Text(
                                          'Log in',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('OR',
                                      style: TextStyle(color: txtColor)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('New User? ',
                                              style:
                                                  TextStyle(color: txtColor)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegistrationPage()));
                                            },
                                            child: const Text(
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
                ),
              ),
            ),
    );
  }
}

// Custom Button

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.color, required this.txt, required this.width});
  final Color color;
  final String txt;
  final double width;
  //final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Center(child: Text(txt, style: const TextStyle(fontSize: 15))),
    );
  }
}
