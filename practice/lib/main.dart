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
      title: 'Column & Row',
      home: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container( color: Colors.blue[300], width: 100, height: 100),
              Container( color: Colors.red, width: 100, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}