import 'package:flutter/material.dart';
import 'package:tvchat/models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0 * 0.75,
        vertical: 20.0 / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF00BF6D).withOpacity(1.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}