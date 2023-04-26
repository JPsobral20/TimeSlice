import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Login/Box/LoginBoxesBuilder.dart';
import 'package:projeto/Screen/Login/Box/RememberLoginBox.dart';
import 'package:projeto/Screen/Login/Button/SignInButton.dart';
import 'package:projeto/Widgets/AppTitle.dart';
import 'package:projeto/Screen/Login/Button/LoginButton.dart';


class SignInScreen extends StatelessWidget{

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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
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
                        ),
                        SizedBox(height: 20.0),
                        LoginBoxesBuilder(
                          textBox: "Enter Password",
                          obscureText: true,
                          textType: TextInputType.visiblePassword,
                          hintText: "Password",
                          icon: Icons.lock,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: RememberLoginBox(),
                        ),
                        LoginButton(text: "Sign Up"),
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
                                Navigator.of(context).pop();
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
}
