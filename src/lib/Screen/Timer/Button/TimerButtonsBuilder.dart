import 'package:flutter/material.dart';

class TimerButtonsBuilder extends StatelessWidget {
  final void Function() onPressed;
  final Color backgroundColor;
  final String text;

  const TimerButtonsBuilder({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 22.0
          ),
        ),
      ),
    );
  }
}