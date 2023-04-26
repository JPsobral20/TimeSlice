import 'package:flutter/material.dart';

class RememberLoginBox extends StatefulWidget {

  bool rememberMe;

  RememberLoginBox({
    super.key,
    this.rememberMe = false,
  });

  @override
  RememberLoginBoxState createState() => RememberLoginBoxState();

}

class RememberLoginBoxState extends State<RememberLoginBox>{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: widget.rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  widget.rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            "Remember me",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}


