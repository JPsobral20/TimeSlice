import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:projeto/Screen/Timer/Button/TimerButtonsBuilder.dart';
import 'package:vibration/vibration.dart';


class TimerScreen extends StatefulWidget{
  const TimerScreen({super.key});

  @override
  TimerScreenState createState() => TimerScreenState.withDefaultTime();
}

class TimerScreenState extends State<TimerScreen>{
  late String id;
  int min = 0;
  int totalTime = 0;
  int currTime = 0;
  double percent = 0.0;
  int secs = 0;
  int timeInMins;
  int timeInSecs;
  Timer? timer;
  int totalSecs;
  final controller = TextEditingController();
  late Future<bool> futureVibrate;

  Future<bool> setVibrate() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    return userDoc.get('vibrate');
  }

  @override
  void initState() {
    super.initState();
    futureVibrate = setVibrate();
    controller.text = "0";
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }


  TimerScreenState(this.timeInMins) : timeInSecs = timeInMins * 60, totalSecs = timeInMins * 60;

  factory TimerScreenState.withDefaultTime() {
    return TimerScreenState(0);
  }

  startTimer()  {
    setState((){
      min = timeInMins;
    });
    timer = Timer.periodic(Duration(seconds: 1), (_) async {
      setState(() {
        if (timeInSecs > 0){
          timeInSecs--;
          if (secs == 0 ){
            secs = 59;
            if (timeInMins != 0){
              timeInMins--;
            }
            else{
              percent = 1;
            }
          }
          else{
            secs--;
          }

          percent += 1/(totalSecs+1);
        }
        else {
          percent = 1;
          updateTime();
          stopTimer();
        }
      });
      if (percent == 1){
        if (await futureVibrate == true){
          Vibration.vibrate(duration: 5000);
        }
      }
    });

  }

  Future updateTime() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    setState((){
      totalTime = userDoc.get('totalTime');
      currTime = userDoc.get('currTime');
      FirebaseFirestore.instance.collection('Users').doc(id).update({'totalTime': totalTime + min});
      FirebaseFirestore.instance.collection('Users').doc(id).update({'currTime': currTime + min});
    });
  }


  stopTimer(){ setState(() { timer?.cancel(); }); }

  startButton() => TimerButtonsBuilder(onPressed: startTimer, backgroundColor: Colors.blue, text: "Start Studying",);


  pauseButton() => TimerButtonsBuilder(onPressed: stopTimer, backgroundColor: Colors.red, text: "Pause",);


  resumeButton() => TimerButtonsBuilder(onPressed: startTimer, backgroundColor: Colors.green, text: "Resume",);


  bool isCompleted(){
    if (timeInSecs == 0){
      return true;
    }
    if (timeInSecs == 0 || totalSecs == timeInMins*60) return true;
    return false;
  }


  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;

    if (isCompleted()) return startButton();

    return isRunning ? pauseButton() : resumeButton();
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
          color: Color(0xfff3e5f5),
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
                  color: Color(0xff5e96d5),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
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
                  "${"$timeInMins".padLeft(2,"0")}:${"$secs".padLeft(2,"0")}",
                  style: TextStyle(
                    color: Colors.black,
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
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      readOnly: readonly(),
                                      onTapOutside: (number) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                      onFieldSubmitted: (number){
                                        setState(() {
                                          if (number == "") number = "0";
                                          timeInMins = int.parse(number);
                                          if (timeInMins > 120) timeInMins = 120;
                                          timeInSecs = timeInMins * 60;
                                          totalSecs = timeInMins * 60;
                                          secs = 0;
                                          percent = 0;
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
                                      (totalSecs~/300).toString(),
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
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: buildButtons(),
                          ),
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