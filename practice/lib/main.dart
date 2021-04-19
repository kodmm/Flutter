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
      title: 'Direction',
      home: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(
              'Direction',
              style: TextStyle(color:Colors.blue,fontSize: 30),
            ),
            Text(
              'Direction',
              style: TextStyle(color:Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}