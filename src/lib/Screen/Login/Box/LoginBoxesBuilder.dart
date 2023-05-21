import 'package:flutter/material.dart';

class LoginBoxesBuilder extends StatelessWidget{
  final String textBox;
  final bool obscureText;
  final TextInputType textType;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const LoginBoxesBuilder({
    super.key,
    required this.textBox,
    required this.obscureText,
    required this.textType,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          textBox,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: textType,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                icon,
                color: Color(0xfff3e5f5),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black38
              )
            ),
          ),
        )
      ],
    );
  }
}