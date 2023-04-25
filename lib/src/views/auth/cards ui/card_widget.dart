import 'package:flutter/material.dart';

class ColoredBoxWithLabel extends StatelessWidget {
  final String label;
  final Color color;

  const ColoredBoxWithLabel(
      {super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      padding: const EdgeInsets.all(10),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
