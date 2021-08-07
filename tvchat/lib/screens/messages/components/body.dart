import 'package:flutter/material.dart';
import 'chat_input_field.dart';
import 'package:tvchat/models/ChatMessage.dart';

import 'message.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              itemCount: demoChatMessages.length,
              itemBuilder: (context, index) => Message(message: demoChatMessages[index],),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}



