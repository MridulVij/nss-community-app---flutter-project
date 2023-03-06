import 'package:flutter/material.dart';

class ColoredBoxWithLabel extends StatelessWidget {
  final String label;
  final Color color;

  ColoredBoxWithLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Text(label, style: TextStyle(color: Colors.white)),
      padding: EdgeInsets.all(10),
    );
  }
}
