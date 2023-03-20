import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../Home/side_bar/sidebar.dart';
import '../colors/colors.dart';

class notificationsScreen extends StatefulWidget {
  const notificationsScreen({super.key});

  @override
  State<notificationsScreen> createState() => _notificationsScreenState();
}

class _notificationsScreenState extends State<notificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WebviewScaffold(url: 'https://nssjmieti.netlify.app/')));
  }
}
