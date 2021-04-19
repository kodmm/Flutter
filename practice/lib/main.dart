import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const data = [Text("item0"), Text("item1"), Text("item2"), Text("item3"),
      Text("item4")];
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: data
        ),
      ),
    );
  }
}