import 'package:flutter/material.dart';

class TimeToSpendBox extends StatelessWidget {

  final int currTime;

  const TimeToSpendBox({
    super.key,
    required this.currTime,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Your points: ',
            style: TextStyle(
              color: Color(0xffce93d8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: currTime.toString(),
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}