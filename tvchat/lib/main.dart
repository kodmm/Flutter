import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tvchat/services/auth.dart';

void main() {
  runApp(FlutterFireInit());
}

final FirebaseAuth auth = FirebaseAuth.instance;
const Color kAccentColor = Color(0xFFB3E5FC);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TvChat',
      theme: ThemeData.dark().copyWith(
        accentColor: kAccentColor,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Header(),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _HeaderBackground extends StatelessWidget {
  final double height;

  const _HeaderBackground({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              Color(0xFFB3E5FC),
              Color(0xFF4FC3F7),
            ],
            stops: [0, 1],
          ),
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: kTextColorPrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: 4),
        Text(
          'Sign in to continue',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: kTextColorPrimary),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 300;
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderBackground(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 120),
              child: _HeaderTitle(),
            ),
          ),

        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: (){
              AuthMethods().signInWithGoogle(context);
            },
            icon: Icon(FontAwesomeIcons.google),
            label: Text("Sign in with Google"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4285F4)),
            ),
          ),
          ],
      ),
    );
  }
}

class FlutterFireInit extends StatefulWidget {
  @override
  _FlutterFireInitState createState() => _FlutterFireInitState();
}

class _FlutterFireInitState extends State<FlutterFireInit> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          return Container(color: Colors.red, width: 300.0, height: 300.0);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // return MyApp();
          return MyApp();
        }

        // return Loading();
        return Container(color: Colors.blue, width: 300.0, height: 300.0);
      },
    );
  }
}
