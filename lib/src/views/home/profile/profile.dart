import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

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
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: backgnd,
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Change UserName',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Icon(Icons.edit),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ChangePassword',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Icon(Icons.edit),
                    ))
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Changes'),
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
