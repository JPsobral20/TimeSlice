import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserContributionText extends StatefulWidget{
  const UserContributionText({super.key});

  @override
  UserContributionTextState createState() => UserContributionTextState();
}

class UserContributionTextState extends State<UserContributionText>{

  late Future<int> futureUserContribution;

  Future<int> setUserContribution() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    return userDoc.get('totalTime');
  }

  @override
  void initState() {
    super.initState();
    futureUserContribution = setUserContribution();
  }


  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(future: futureUserContribution, initialData: null, builder: (ctx, snapshot) {
        return Text(
        "${snapshot.data}€",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
        ),
      );
    });
  }
}