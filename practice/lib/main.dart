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
      title: 'Alignment',
      home: Center(
        child: Container(
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container( color: Colors.blue, width: 50, height: 50),
              Container( color: Colors.red, width: 50, height: 50),
              Container( color: Colors.green, width: 50, height: 50),
              Container( color: Colors.orange, width: 50, height: 50),
            ],
          ),
        ),
      ),
    );
  }
}