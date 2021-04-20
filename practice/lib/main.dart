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
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Center(
          child: ChangeForm(),
        ),
      ),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  String _defaultValue = 'りんご';
  List<String> _list = <String>['りんご', 'オレンジ', 'みかん', 'ぶどう'];
  String _text ='';

  void _handleChange(String newValue) {
    setState((){
      _text = newValue;
      _defaultValue = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text(
            "$_text",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500
            ),
          ),
          DropdownButton<String>(
            value: _defaultValue,
            onChanged: _handleChange,
            items: _list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      )
    );
  }
}