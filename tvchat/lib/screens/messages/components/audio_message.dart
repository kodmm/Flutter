import 'package:flutter/material.dart';
import 'package:tvchat/models/ChatMessage.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message,
  }): super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0 / 0.75,
        vertical: 20.0 / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF00BF6D).withOpacity(1.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 / 2),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.white,
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0.37",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}