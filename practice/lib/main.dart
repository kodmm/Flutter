import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material Design',
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300.0,
            height: 300.0,
            child: Text('word'),
            // padding: const EdgeInsets.all(50.0),
            padding: const EdgeInsets.only(top:50.0),
            // alignment: Alignment.center,
            alignment: Alignment.bottomRight,
            transform: Matrix4.rotationZ(0.1)
          ),
        ),
      ),
    );
  }
}