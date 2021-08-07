import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body()
    );
  }
}

AppBar buildAppBar() {
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
                  "SMAP".substring(0, 1),
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
                  "SMAP",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "SMAP X SMAP",
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