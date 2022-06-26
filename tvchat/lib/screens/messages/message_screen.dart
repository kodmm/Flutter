import 'package:flutter/material.dart';


import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen(
      this.broadCastingOffice,
      this.onAirProgram,
      );
  final String broadCastingOffice, onAirProgram;
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.broadCastingOffice, widget.onAirProgram),
      body: Body(widget.broadCastingOffice)
    );
  }
}

AppBar buildAppBar(String broadCastingOffice, onAirProgram) {
  return AppBar(
      title: Row(
        children: [
          ClipOval(
            child: Container(
              color: Colors.greenAccent,
              width: 48,
              height: 48,
              child: Center(
                child: Text(
                  broadCastingOffice.substring(0, 1),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0 * 0.75),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  broadCastingOffice,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  onAirProgram,
                  style: TextStyle(fontSize: 12),
                )
              ]
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.post_add_outlined),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(
            Icons.help_outlined,
          ),
          onPressed: (){},
        ),
        SizedBox(width: 20.0 / 2),
      ]
  );
}