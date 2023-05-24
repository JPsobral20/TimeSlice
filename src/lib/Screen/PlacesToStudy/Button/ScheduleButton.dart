import 'package:flutter/material.dart';

class ScheduleButton extends StatelessWidget {
  final String schedule, roomName;

  const ScheduleButton({
    super.key,
    required this.schedule,
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title:Text(roomName),
            content: Text(schedule),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Back"),
              ),
            ],
          ),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(left: 0),
      ),
      child: Text(
        "See schedule",
        style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}