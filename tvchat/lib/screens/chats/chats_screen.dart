import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFF00BF6D),
        child: Icon(Icons.tv_outlined, color: Colors.white,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
            BottomNavigationBarItem(icon: ClipOval(
              child: Container(
                color: Colors.greenAccent,
                width: 32,
                height: 32,
                child: Center(
                  child: Text(
                    "SMAP".substring(0,1),
                    style: TextStyle(
                      color: Colors.white, fontSize: 24
                    ),
                  ),
                ),
              ),
            ),
              label: "Profile",
            ),
          ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("TV"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.more_vert_outlined),
          onPressed: (){},
        )
      ],
    );
  }
}