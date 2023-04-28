import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../auth/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finalEmail;

  @override
  void initState() {
    getValidation().whenComplete(() async {
      Timer(
          const Duration(seconds: 2),
          () => Get.to(
              finalEmail == null ? const LoginPage() : const spareScreen()));
    });
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var obtainedEmail = sp.getString('token');
    setState(() {
      finalEmail = obtainedEmail;
    });
    if (kDebugMode) {
      print(finalEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Center(
              child: Image.asset('assets/front_screen/nss.png',
                  width: 100, height: 100)),
          const Center(
            child: Text('NSS COMMUNITY',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          const Center(child: Text('Version 1.0.0(Early Access)'))
        ],
      ),
    ));
  }
}
