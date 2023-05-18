import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Login/Button/LoginButton.dart';
import 'package:projeto/Screen/NavigationBar.dart';
import 'package:projeto/Widgets/AppTitle.dart';


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
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffffc58d),
                            Color(0xccffc58d),
                            Color(0x99ffc58d),
                            Color(0x66ffc58d),
                            Color(0x33ffc58d),
                          ]
                      )
                  ),
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
                              color: Colors.white,
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
                            onPressed: () {
                              FirebaseAuth.instance.currentUser!.delete();
                              Navigator.of(context).pop();
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