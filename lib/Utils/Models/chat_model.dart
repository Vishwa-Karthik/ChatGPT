class ChatMessage {
  final String? text;
  final ChatMessageType? type;

  ChatMessage({required this.text, required this.type});
}

enum ChatMessageType { user, bot }
