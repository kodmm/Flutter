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
      home: Center(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Baseline',
                style: TextStyle(color:Colors.blue,fontSize:50),
              ),
              Text(
                'Baseline',
                style: TextStyle(color:Colors.red,fontSize:25)
              ),
            ],
          ),

        ),
      ),
    );
  }
}