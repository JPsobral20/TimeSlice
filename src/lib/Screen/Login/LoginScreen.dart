import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Login/Box/LoginBoxesBuilder.dart';
import 'package:projeto/Screen/Login/Button/ForgotPasswordButton.dart';
import 'package:projeto/Screen/Login/Button/SignInButton.dart';
import 'package:projeto/Screen/NavigationBar.dart';
import 'package:projeto/Screen/SignIn/SignInScreen.dart';
import 'package:projeto/Widgets/AppTitle.dart';
import 'package:projeto/Screen/Login/Button/LoginButton.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen>{

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
                        "Login Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 40.0),
                      LoginBoxesBuilder(
                          key: Key("emailfield"),
                          textBox: "Enter email",
                          obscureText: false,
                          textType: TextInputType.emailAddress,
                          hintText: "Email",
                          icon: Icons.email,
                          controller: emailController,
                      ),
                      SizedBox(height: 20.0),
                      LoginBoxesBuilder(
                          key: Key("passwordfield"),
                          textBox: "Enter Password",
                          obscureText: true,
                          textType: TextInputType.visiblePassword,
                          hintText: "Password",
                          icon: Icons.lock,
                          controller: passwordController,
                      ),
                      ForgotPasswordButton(),
                      LoginButton(
                        key: Key("Loginbutton"),
                        text: "Login",
                        onPressed: () {
                          login();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SignInButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                            },
                            text: "Sign Up",
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

  login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigatorBar()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not found'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password'),
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
              content: Text('no internet access'),
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
