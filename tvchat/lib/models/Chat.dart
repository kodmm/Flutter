
class Chat {
  final String name, lastMessage, lastMessageSendBy, onAirProgram;
  final String users;
  final String lastMessageSendTs;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.lastMessageSendBy = '',
    this.lastMessageSendTs = '',
    this.onAirProgram = '',
    this.users = '',

  });
}

List chatsData = [
  Chat(
    name: "TBS",
    lastMessage: "Good Luck",
  ),
  Chat(
    name: "E-テレ",
    lastMessage: "Good Luck",
  ),
  Chat(
    name: "NHK",
    lastMessage: "紅白歌合戦",
  ),
  Chat(
    name: "日テレ",
    lastMessage: "ナカイの窓",
  ),
  Chat(
    name: "テレ朝",
    lastMessage: "アイムホーム",
  ),
  Chat(
    name: "テレビ東京",
    lastMessage: "アノニマス",
  ),
  Chat(
    name: "フジテレビ",
    lastMessage: "HERO",
  ),
];