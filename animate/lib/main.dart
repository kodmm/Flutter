import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
  with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(controller);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // アニメーションの再生
                controller.forward();
              },
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                controller.stop();
              },
              icon: Icon(Icons.stop),
            ),
            IconButton(
              onPressed: () {
                controller.repeat();
              },
              icon: Icon(Icons.loop),
            ),
          ],
        ),
      ),
    body: Center(
      child: ScaleTransition(
        scale: animation,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ),
    ),
    );
  }

}