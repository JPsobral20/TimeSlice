import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const SignInButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}