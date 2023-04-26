import 'package:flutter/material.dart';

class SoundBox extends StatefulWidget{
  bool SoundOn;

  SoundBox({
    this.SoundOn = true,
    super.key,
  });

  @override
  SoundBoxState createState() => SoundBoxState();
}

class SoundBoxState extends State<SoundBox>{


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
          Text("Sound Alert"),
          Spacer(),
          Switch(
            activeColor: Colors.amber,
            activeTrackColor: Colors.cyan,
            inactiveThumbColor: Colors.blueGrey.shade600,
            inactiveTrackColor: Colors.grey.shade400,
            splashRadius: 50.0,
            value: widget.SoundOn,
            onChanged: (value) => setState(() => widget.SoundOn = value),
          ),
        ],
      ),
    );
  }
}