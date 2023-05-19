import 'package:cloud_firestore/cloud_firestore.dart';
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



  Future<int> setTotalTime(bool totalTime) async{
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
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0, right: 10.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: AppTitle(size: 42),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
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
                                ],
                              ),
                            ),
                            Flexible(
                              flex:3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    percent: getPercent(snapshot.data ?? 0),
                                    animation: true,
                                    animateFromLastPercent: true,
                                    radius: 140.0,
                                    lineWidth: 27.0,
                                    progressColor: Colors.blueGrey,
                                    center: Text(
                                      "${getNewTotalTime(snapshot.data ?? 0)}€",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 80.0,
                                      ),
                                    ),
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child:Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: UserContribution(),
                                ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Já foram concluidas um total de ${getTotalScholarship(snapshot.data ?? 0)} Scholarships",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
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

class UserContribution extends StatelessWidget {
  const UserContribution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Já contribuíu com um total de",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
        UserContributionText(),
      ],
    );
  }
}
