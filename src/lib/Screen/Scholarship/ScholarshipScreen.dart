import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:projeto/Screen/Scholarship/Widgets/UserContributionText.dart';
import '../../Widgets/AppTitle.dart';


class ScholarshipScreen extends StatefulWidget {
  const ScholarshipScreen({super.key});

  @override
  ScholarshipScreenState createState() => ScholarshipScreenState();
}

class ScholarshipScreenState extends State<ScholarshipScreen> {

  late Future<int> futureTotalTime;
  int addTotalTime1 = 0;



  Future<int> setTotalTime(bool totaltime) async{
    int addTotalTime = 0;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').get();
    for (var element in snapshot.docs) {
      addTotalTime += element['totalTime'] as int;
    }
    return addTotalTime;
  }



  @override
  void initState() {
    super.initState();
    futureTotalTime = setTotalTime(false);
  }

  String getNewTotalTime(int totalTime){
    return (totalTime % 5000).toString();
  }

  double getPercent(int totalTime){
    totalTime %= 5000;
    return totalTime/5000;
  }

  String getTotalScholarship(int totalTime){
    return (totalTime ~/ 5000).toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              FutureBuilder(future: futureTotalTime, initialData: null, builder: (ctx, snapshot) {
                return Container(
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
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Preço da Scholarship: 5000€",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 27.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: getPercent(snapshot.data ?? 0),
                                animation: true,
                                animateFromLastPercent: true,
                                radius: 155.0,
                                lineWidth: 27.0,
                                progressColor: Colors.blueGrey,
                                center: Text(
                                  getNewTotalTime(snapshot.data ?? 0) + "€",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 80.0,
                                  ),
                                ),
                            ),
                            SizedBox(height: 50.0),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Já contribuíu com um total de",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 27.0,
                                ),
                              ),
                            ),
                            UserContributionText(),
                            SizedBox(height: 30),
                            Text(
                              "Já foram concluidas um total de " + getTotalScholarship(snapshot.data ?? 0) + " Scholarships",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            )
                          ]
                      )
                  )
                );
              })
            ]
          )
        )
      )
    );
  }
}