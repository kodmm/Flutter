import 'package:flutter/material.dart';
class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

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
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}