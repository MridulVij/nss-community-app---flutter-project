import 'package:flutter/material.dart';
import 'package:nss_jmieti/UI/colors/colors.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: backgnd,
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change UserName',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(Icons.edit),
                    ))
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ChangePassword',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(Icons.edit),
                    ))
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save Changes'),
            ),
            // Image
            // User Name
            // Email ID
            // Log out option
          ],
        ),
      ),
    );
  }
}
