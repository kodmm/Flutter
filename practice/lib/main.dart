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
      title: 'Expanded',
      home: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child:Container( color: Colors.blue)
            ),
            Expanded(
              child: Container( color: Colors.red),
            ),
            Expanded(
              child: Container( color: Colors.green),
            ),
            Expanded(
              child: Container( color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}