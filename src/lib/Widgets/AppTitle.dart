import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double size;

  const AppTitle({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Time',
            style: TextStyle(
              color: Color(0xff2270c5),
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Slice',
            style: TextStyle(
              color: Color(0xb85e96d5),
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}