import 'package:flutter/material.dart';

class AvatarComponent extends StatelessWidget {
  final String imagePath;

  AvatarComponent({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
