import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Login/Box/LoginBoxesBuilder.dart';
import 'package:projeto/Screen/Login/Button/SignInButton.dart';
import 'package:projeto/Screen/Login/LoginScreen.dart';
import 'package:projeto/Screen/SignIn/VerifyEmailScreen.dart';
import 'package:projeto/UserModel.dart';
import 'package:projeto/Widgets/AppTitle.dart';
import 'package:projeto/Screen/Login/Button/LoginButton.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 40.0),
                        LoginBoxesBuilder(
                          textBox: "Enter email",
                          obscureText: false,
                          textType: TextInputType.emailAddress,
                          hintText: "Email",
                          icon: Icons.email,
                          controller: emailController,
                        ),
                        SizedBox(height: 20.0),
                        LoginBoxesBuilder(
                          textBox: "Enter Password",
                          obscureText: true,
                          textType: TextInputType.visiblePassword,
                          hintText: "Password",
                          icon: Icons.lock,
                          controller: passwordController,
                        ),
                        SizedBox(height: 18.0),
                        LoginButton(
                          text: "Sign Up",
                          onPressed: () async {
                            await signIn();
                            if (FirebaseAuth.instance.currentUser != null) {
                              String uid = FirebaseAuth.instance.currentUser!.uid;
                              await createUser(uid: uid, email: emailController.text);
                            }
                          }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            SignInButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              text: "Log In",
                            ),
                          ],
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



  static Future createUser({required String uid, required String email}) async{
    final docUser = FirebaseFirestore.instance.collection("Users").doc();
    final user = UserModel(uid: uid, email: email, totalTime: 0, currTime: 0, products: [], vibrate: true);
    final json = user.toJson();
    await docUser.set(json);
  }


  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential != null) {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await createUser(uid: uid, email: emailController.text);
        await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password must have more than 5 characters'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else if (e.code == 'invalid-email'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else if (e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already exist'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else if (e.code == 'unknown'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid credentials'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else if (e.code == 'network-request-failed'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No internet access'),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            )
        );
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.code),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
    }
  }

}
