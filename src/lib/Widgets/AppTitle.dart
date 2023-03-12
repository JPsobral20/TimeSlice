import 'package:flutter/material.dart';


class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "TimeSlice",
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}