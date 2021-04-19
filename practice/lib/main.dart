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
          title: Text('ListView'),
        ),
        body: ListView(
          children: [
            _menuItem("menu1", Icon(Icons.settings)),
            _menuItem("menu2", Icon(Icons.map)),
            _menuItem("menu3", Icon(Icons.room)),
            _menuItem("menu4", Icon(Icons.local_shipping)),
            _menuItem("menu5", Icon(Icons.airplanemode_active)),
          ]
        ),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            color:Colors.black,
            fontSize: 18.0
          ),
        ),
        onTap:(){
          print("onTap called.");
        },
        onLongPress: (){
          print("onLongPress called.");
        },
      ),
    );
  }
}