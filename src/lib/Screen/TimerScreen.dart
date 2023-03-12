import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerScreen extends StatefulWidget{
  @override
  TimerSreenState createState() => TimerSreenState.withDefaultTime();

}

class TimerSreenState extends State<TimerScreen>{
  double percent = 0.0;
  int Secs = 0;
  int TimeInMins;
  int TimeInSecs;
  Timer? timer;
  int TotalSecs;

  TimerSreenState(this.TimeInMins) : this.TimeInSecs = TimeInMins * 60, this.TotalSecs = TimeInMins * 60;
  factory TimerSreenState.withDefaultTime() {
    return TimerSreenState(25);
  }

  StartTimer(){

    timer = Timer.periodic(Duration(milliseconds: 20), (_){
      setState((){
        if (TimeInSecs > 0){
          TimeInSecs--;
          if (Secs == 0 ){
            Secs = 59;
            if (TimeInMins != 0){
              TimeInMins--;
            }
            else{
              percent = 1;
            }
          }
          else{
            Secs--;
          }
          percent += 1/(TotalSecs+1);
        }
        else{
          percent = 1;
          stopTimer();
        }
      });
    });
  }

  stopTimer(){
    setState(() {
      timer?.cancel();
    });
  }

  button_start() => ElevatedButton(

    onPressed: StartTimer,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
    ),
    child: Padding(
      padding: EdgeInsets.all(20.0),
    child: Text("Start Studing",
      style: TextStyle(
          color: Colors.white,
          fontSize: 22.0
      ),
    ),
  ),
  );

  button_pause() => ElevatedButton(

    onPressed: stopTimer,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
    child: Padding(
      padding: EdgeInsets.all(20.0),
    child: Text("Pause",
      style: TextStyle(
          color: Colors.white,
          fontSize: 22.0
      ),
    ),
  ),
  );


  button_resume() => ElevatedButton(

    onPressed: StartTimer,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
    child: Padding(
      padding: EdgeInsets.all(20.0),
    child: Text("Resume",
      style: TextStyle(
          color: Colors.white,
          fontSize: 22.0
      ),
    ),
  ),
  );


  bool iscompleted(){
    if (TimeInSecs == 0 || TotalSecs == TimeInMins*60){return true;}
    return false;
  }

  Widget build_buttons() {
    final isrunning = timer == null ? false : timer!.isActive;

    if (iscompleted()){
      return button_start();
    }

    else {
      return isrunning ? button_pause() : button_resume();
    }
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffffc58d), Color(0xff51a8ff)],
                  begin: FractionalOffset(0.7,1)
              )
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Promodoro Clock",
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 40.0
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 140.0,
                    lineWidth: 22.0,
                    progressColor: Colors.blueGrey,
                    center: Text(
                      "$TimeInMins".padLeft(2,"0") + ":" + "$Secs".padLeft(2,"0"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                      ),
                    )
                ),
              ),
              SizedBox(height: 30.0,),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Study Time",
                                        style: TextStyle(
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(
                                        "25",
                                        style: TextStyle(
                                          fontSize: 80.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Pause Time",
                                        style: TextStyle(
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(
                                        "5",
                                        style: TextStyle(
                                            fontSize: 80.0
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 28.0),
                              child: build_buttons()
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}