import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, audio, image, video}
enum MessageStatus { not_sent, not_view, viewed}

class ChatMessage {
   final String text, sendBy, imgUrl;
   final MessageType messageType;
   final MessageStatus messageStatus;
   final Timestamp ts;

  ChatMessage(
    this.text,
    this.messageType,
    this.messageStatus,
    this.sendBy,
    this.ts,
    this.imgUrl,
  );

  ChatMessage.fromJson(Map<String, dynamic> json)
    : text = json['text'],
      messageType = MessageType.values[json['messageType']],
      messageStatus = MessageStatus.values[json['messageStatus']],
      sendBy = json['sendBy'],
      ts = json['ts'],
      imgUrl = json['imgUrl'];

}

// List demoChatMessages = [
//   ChatMessage(
//     text: "Flow",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "New Starts",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_sent,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "",
//     messageType: ChatMessageType.audio,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "",
//     messageType: ChatMessageType.video,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "Error happend",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_sent,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Yowai Boku dakara",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Your Song",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_view,
//     isSender: true,
//   ),
//
// ];