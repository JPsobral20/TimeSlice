import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                      SizedBox(height: 20.0),
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: 0,
                        animation: true,
                        animateFromLastPercent: true,
                        radius: 155.0,
                        lineWidth: 27.0,
                        progressColor: Colors.blueGrey,
                        center: Text(
                          "4000€",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 80.0,
                          ),
                        )
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        "Total dinheiro angariado",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "0/5000 €",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),
                      )
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