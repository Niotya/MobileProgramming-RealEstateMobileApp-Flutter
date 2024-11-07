import 'package:flutter/material.dart';

class FeatureCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  FeatureCardWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
