import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/AppTitle.dart';


class ScholarshipScreen extends StatefulWidget {
  @override
  ScholarshipScreenState createState() => ScholarshipScreenState();
}

class ScholarshipScreenState extends State<ScholarshipScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff3e5f5),
                      Color(0xfff3e5f5),
                    ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        )
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: AppTitle(size: 42),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Scholarship",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}