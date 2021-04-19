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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: Card(
          margin: const EdgeInsets.all(50.0),
          child: Container(
           margin: const EdgeInsets.all(10.0),
            width: 300,
            height: 100,
            child: Text(
              'Card',
              style: TextStyle(fontSize: 30),
          )
        ),
      )
    )
    );
  }
}