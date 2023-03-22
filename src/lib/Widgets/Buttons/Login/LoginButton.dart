import 'package:flutter/material.dart';
import '../../../Screen/NavigationBar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NavigatorBar()),);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffffc58d),
          elevation: 5,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}