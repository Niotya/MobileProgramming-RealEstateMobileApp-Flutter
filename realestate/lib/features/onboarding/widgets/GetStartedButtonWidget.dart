import 'package:flutter/material.dart';

class GetStartedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  GetStartedButtonWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Lanjutkan'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
