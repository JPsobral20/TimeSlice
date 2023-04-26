import 'package:flutter/material.dart';

class VibrateBox extends StatefulWidget{
   bool vibrationOn;

  VibrateBox({
    this.vibrationOn = true,
    super.key,
  });

  @override
  VibrateBoxState createState() => VibrateBoxState();
}

class VibrateBoxState extends State<VibrateBox>{


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.transparent,
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
      child: Row(
        children: [
          Text("Vibrating Alert"),
          Spacer(),
          Switch(
            activeColor: Colors.amber,
            activeTrackColor: Colors.cyan,
            inactiveThumbColor: Colors.blueGrey.shade600,
            inactiveTrackColor: Colors.grey.shade400,
            splashRadius: 50.0,
            value: widget.vibrationOn,
            onChanged: (value) => setState(() => widget.vibrationOn = value),
          ),
        ],
      ),
    );
  }
}