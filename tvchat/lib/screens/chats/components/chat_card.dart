import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final DocumentSnapshot chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0 * 0.75),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.greenAccent,
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    chat["name"].substring(0, 1),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 20.0)
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat["name"],
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat["onAirProgram"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}