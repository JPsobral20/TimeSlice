import 'package:flutter/material.dart';

class SnackBarMessage extends StatelessWidget {
  final String text;

  const SnackBarMessage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
    );
  }
}