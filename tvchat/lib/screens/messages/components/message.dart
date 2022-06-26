import 'package:flutter/material.dart';
import 'package:tvchat/models/ChatMessage.dart';

import 'audio_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }): super(key: key);

  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    Widget messageContain(ChatMessage message) {
      switch (message.messageType) {
        case MessageType.text:
          return TextMessage(message: message);

        case MessageType.audio:
          return AudioMessage(message: message);

        case MessageType.video:
          return VideoMessage();

        default:
          return SizedBox();
      }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...[
              ClipOval(
                child: Container(
                  color: Colors.greenAccent,
                  width: 24,
                  height: 24,
                  child: Center(
                    child: Text(
                      message.sendBy.substring(0,1),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0 / 2),
            ],
            messageContain(message),
            MessageStatusDot(status: message.messageStatus)
          ]
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({
    Key? key,
    this.status
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch(status) {
        case MessageStatus.not_sent:
          return Color(0xFFF03738);

        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);

        case MessageStatus.viewed:
          return Colors.greenAccent;

        default:
          return Colors.transparent;

      }
    }
    return Container(
      margin: EdgeInsets.only(left: 20.0 / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
