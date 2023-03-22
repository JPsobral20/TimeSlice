import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Widgets/Box/LoginBoxesBuilder.dart';
import 'package:projeto/Widgets/Buttons/Login/ForgotPasswordButton.dart';
import 'package:projeto/Widgets/AppTitle.dart';
import 'package:projeto/Widgets/Buttons/Login/LoginButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{

  bool isRememberMe = false;

  RememberLoginBox() => Container(
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                isRememberMe = value!;
              });
            },
          ),
        ),
        Text(
          "Remember me",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );



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
                      AppTitle(),
                      SizedBox(height: 40.0),
                      Text(
                        "Login Account",
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
                      ForgotPasswordButton(),
                      RememberLoginBox(),
                      LoginButton(),
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
