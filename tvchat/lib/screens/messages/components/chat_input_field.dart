import 'package:flutter/material.dart';
import 'package:tvchat/services/database.dart';
import 'package:random_string/random_string.dart';
class ChatInputField extends StatefulWidget {
  ChatInputField(this.myUserName, this.myProfilePic, this.broadCastingOffice);

  final String? myUserName, myProfilePic;
  final String broadCastingOffice;
  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  TextEditingController messageTextEditingController = TextEditingController();
  String messageId = "";

  addMessage() {
    if (messageTextEditingController.text != "") {
      String message = messageTextEditingController.text;
      var lastMessageTs = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "imgUrl": widget.myProfilePic,
        "messageStatus": 0,
        "messageType": 0,
        "sendBy": widget.myUserName,
        "text": message,
        "ts": lastMessageTs,
      };

      messageId = widget.myUserName.toString() +
          "_" + randomAlphaNumeric(12);

      DatabaseMethods().addMessage(
          widget.broadCastingOffice, messageId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendBy": widget.myUserName,
          "lastMessageSendTs": lastMessageTs,
        };

        DatabaseMethods().updateLastMessageSend(
            widget.broadCastingOffice, lastMessageInfoMap);

            () {
          messageTextEditingController.text = "";
        }();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0 / 1,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            ),
          ]
      ),
      child: SafeArea(child: Row(
        children: [
          Icon(Icons.mic, color: Color(0xFF00BF6D)),
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0 * 0.75,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF00BF6D).withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                  ),
                  SizedBox(width: 20.0 / 4),
                  Expanded(
                    child: TextField(
                      controller: messageTextEditingController,
                      decoration: InputDecoration(
                        hintText: "Type message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                  ),
                  SizedBox(width: 20.0 / 4),
                  Icon(
                    Icons.camera_alt_outlined,
                  ),
                  GestureDetector(
                    onTap: () {
                        addMessage();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}