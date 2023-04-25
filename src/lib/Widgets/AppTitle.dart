import 'package:flutter/material.dart';


class AppTitle extends StatelessWidget {
  final double size;

  const AppTitle({
    super.key,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Time',
            style: TextStyle(
              color: Colors.black,
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Slice',
            style: TextStyle(
              color: Colors.white,
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}