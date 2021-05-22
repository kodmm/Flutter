import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double width = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            width = 200;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          // 1.アニメーションの動作時間,
          duration: Duration(seconds: 2),
          // 変化させたいプロパティ,
          width: width,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}