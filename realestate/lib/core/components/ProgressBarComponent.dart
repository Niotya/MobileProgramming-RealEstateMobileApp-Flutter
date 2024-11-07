import 'package:flutter/material.dart';

class ProgressBarComponent extends StatelessWidget {
  final double progress; // nilai progress antara 0 dan 1

  ProgressBarComponent({required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey[300],
      color: Colors.blue,
    );
  }
}
