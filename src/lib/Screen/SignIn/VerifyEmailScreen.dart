import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Login/Button/LoginButton.dart';
import 'package:projeto/Screen/NavigationBar.dart';
import 'package:projeto/Widgets/AppTitle.dart';
import 'package:projeto/Screen/SignIn/SignInScreen.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final auth = FirebaseAuth.instance;
  Timer? timer;
  User? user;

  @override
  void initState(){
    user = auth.currentUser;
    user!.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkEmailVerify();
    });
    super.initState();
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Color(0xfff3e5f5),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 70.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppTitle(size: 50),
                        SizedBox(height: 40.0),
                        Text(
                          "Verify email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          "We sent you a verify email link",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40.0),
                        LoginButton(
                            text: "Back",
                            onPressed: ()  async{
                              String uid = FirebaseAuth.instance.currentUser!.uid;
                              print("ok1\n");
                              final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
                              print("ok2\n");
                              String id = snapshot.docs.first.id;
                              print("ok3\n");
                              await FirebaseFirestore.instance.collection('Users').doc(id).delete();
                              print("ok4\n");
                              FirebaseAuth.instance.currentUser!.delete();
                              print("ok5\n");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(key: Key("SignInScreen"))));
                              print("ok6\n");
                            }
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }


  Future<void> checkEmailVerify() async{
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified){
      timer?.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigatorBar()));
    }
  }


}