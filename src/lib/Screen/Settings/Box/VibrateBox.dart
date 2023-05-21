import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class VibrateBox extends StatefulWidget{
  const VibrateBox({super.key});

  @override
  VibrateBoxState createState() => VibrateBoxState();
}

class VibrateBoxState extends State<VibrateBox>{

  late Future<bool> futureVibrate;
  late bool isVibrate;

  Future<bool> setVibrate() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    setState(() {
      isVibrate = userDoc.get('vibrate');
    });
    return userDoc.get('vibrate');
  }

  @override
  void initState() {
    super.initState();
    futureVibrate = setVibrate();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Vibrating Alert"),
          ),
          Spacer(),
          FutureBuilder(future: futureVibrate, initialData: null, builder: (ctx, snapshot) {
            return Switch(
              activeColor: Color(0xddd034f5),
              activeTrackColor: Color(0xffce93d8),
              inactiveThumbColor: Colors.blueGrey.shade600,
              inactiveTrackColor: Colors.grey.shade400,
              splashRadius: 50.0,
              value: snapshot.data ?? true,
              onChanged: (value) async{
                String uid = FirebaseAuth.instance.currentUser!.uid;
                final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
                String id = snapshot.docs.first.id;
                FirebaseFirestore.instance.collection('Users').doc(id).update({'vibrate': !isVibrate});
                futureVibrate = setVibrate();
              }
            );
          })
        ],
      ),
    );
  }
}