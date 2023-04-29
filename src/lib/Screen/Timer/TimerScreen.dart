import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:projeto/Screen/Timer/Button/TimerButtonsBuilder.dart';

class TimerScreen extends StatefulWidget{
  @override
  TimerScreenState createState() => TimerScreenState.withDefaultTime();

}

class TimerScreenState extends State<TimerScreen>{
  double percent = 0.0;
  int Secs = 0;
  int TimeInMins;
  int TimeInSecs;
  Timer? timer;
  int TotalSecs;
  bool isFinish = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = "0";
  }

  TimerScreenState(this.TimeInMins) : this.TimeInSecs = TimeInMins * 60, this.TotalSecs = TimeInMins * 60;

  factory TimerScreenState.withDefaultTime() {
    return TimerScreenState(0);
  }

  startTimer(){
    setState(() {
      this.isFinish = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (_){
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


  stopTimer(){ setState(() { timer?.cancel(); }); }

  startButton() => TimerButtonsBuilder(onPressed: startTimer, backgroundColor: Colors.blue, text: "Start Studing",);


  pauseButton() => TimerButtonsBuilder(onPressed: stopTimer, backgroundColor: Colors.red, text: "Pause",);


  resumeButton() => TimerButtonsBuilder(onPressed: startTimer, backgroundColor: Colors.green, text: "Resume",);


  bool iscompleted(){
    if (TimeInSecs == 0){
      setState(() {
        percent = 0;
      });
      return true;
    }
    if (TimeInSecs == 0 || TotalSecs == TimeInMins*60) return true;
    return false;
  }


  Widget buildButtons() {
    final isrunning = timer == null ? false : timer!.isActive;

    if (iscompleted()) return startButton();

    return isrunning ? pauseButton() : resumeButton();
  }

  bool readonly(){
    if(timer == null) return false;
    return timer!.isActive;
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      //maintainBottomViewPadding: false,
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xff51a8ff),
            ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Text(
                  "Pomodoro Clock",
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 40.0
                  ),
                ),
              ),
              CircularPercentIndicator(
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
                                      TextFormField(
                                        readOnly: readonly(),
                                        onTapOutside: (number) {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                        },
                                        onFieldSubmitted: (number){
                                          setState(() {
                                            this.TimeInMins = int.parse(number);
                                            if (TimeInMins > 120) this.TimeInMins = 120;
                                            this.TimeInSecs = TimeInMins * 60;
                                            this.TotalSecs = TimeInMins * 60;
                                            this.Secs = 0;
                                            this.percent = 0;
                                          });
                                        },

                                        style: TextStyle(
                                          fontSize: 80.0,
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8.0),
                                          border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        controller: controller,
                                        keyboardType: TextInputType.numberWithOptions(
                                          decimal: false,
                                          signed: true,
                                        ),
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Break",
                                        style: TextStyle(
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      SizedBox(height: 17.0,),
                                      Text(
                                          (TotalSecs/300).toInt().toString(),
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
                            child: buildButtons(),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
        ),
      ),
    );
  }
}