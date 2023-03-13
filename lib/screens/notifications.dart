import 'package:flutter/material.dart';

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
      drawer: sideBar(),
      backgroundColor: whitetext,
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Follow Us'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('More Apps'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Send Feedback'),
                    ),
                    PopupMenuItem(
                      child: Text('Share App with friends'),
                      value: 1,
                    ),
                  ])
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Text('No Notifications'),
      ),
    );
  }
}
