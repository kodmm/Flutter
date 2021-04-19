import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            print(index);
            if (index >= list.length) {
              list.addAll(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]);
            }
            return _messageItem(list[index]);
        },
        )
      )
    );
  }

  Widget _messageItem(String title) {
    return Container(
      width: 100,
      decoration: new BoxDecoration(
        border: new Border(right: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:Center(
        child:Text(
          title,
          style: TextStyle(
            color:Colors.black,
            fontSize: 20.0
          ),
        ),
      )
    );
  }
}
