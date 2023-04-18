import 'package:flutter/material.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyRooms.dart';

class PlacesToStudyItems extends StatelessWidget {
  final PlacesToStudyRooms room;
  //final Function press;

  const PlacesToStudyItems({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 190,
                      child: Text(
                        room.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 175,
                      child: Text(
                        room.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                    padding: EdgeInsets.only(top: 45, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(room.image),
                      ],
                  )
                )
              ),
            ]
          ),
        )
      ],
    );
  }
}