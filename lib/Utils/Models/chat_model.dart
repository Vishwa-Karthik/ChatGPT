class ChatMessage {
  final String? text;
  final ChatMessageType? type;
  final bool isImage;

  ChatMessage({required this.text, required this.type, this.isImage = false});
}

enum ChatMessageType { user, bot }
