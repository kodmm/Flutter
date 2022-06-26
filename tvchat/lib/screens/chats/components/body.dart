import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tvchat/screens/messages/message_screen.dart';
import 'package:tvchat/services/database.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<QuerySnapshot>? broadcastingOffices;

  getBroadcastingOffices() {
    setState(() {
      broadcastingOffices = DatabaseMethods().getBroadcastingOffices();
    });

  }

  @override
  void initState(){
    getBroadcastingOffices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<QuerySnapshot>(
            future: broadcastingOffices,
            builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return Text("Document does not exit");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return ChatCard(
                      chat: data,
                      press: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessagesScreen(data['name'], data['onAirProgram']),
                            ),
                          ),
                    );
                  }
                );
              }

              return Text("Loading");
            }
          ),
        ),
      ],
    );
  }
}


