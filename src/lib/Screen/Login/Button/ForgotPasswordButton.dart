import 'package:flutter/material.dart';


class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(right: 0),
        ),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}