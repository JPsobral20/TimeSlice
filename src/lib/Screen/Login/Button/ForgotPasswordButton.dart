import 'package:flutter/material.dart';
import 'package:projeto/Screen/Login/ForgotPasswordScreen.dart';


class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen())),
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(right: 2),
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