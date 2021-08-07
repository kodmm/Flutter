import 'package:flutter/material.dart';
import 'package:tvchat/models/Chat.dart';
import 'package:tvchat/screens/messages/message_screen.dart';

import 'chat_card.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessagesScreen(),
                    ),
                ),
            ),
          ),
        ),
      ],
    );
  }
}

