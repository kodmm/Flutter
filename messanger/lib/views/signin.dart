import 'package:flutter/material.dart';
import 'package:messanger/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messagenger Clone")),
      body: Center(
          child: GestureDetector(
            onTap: (){
              AuthMethods().signInWithGoogle(context);
            },
            child: Container(
              color: Color(0xffDB4437),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              child: Text(
                "Sign in with Google",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
      ),
    );
  }
}