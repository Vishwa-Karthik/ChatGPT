import 'package:chatgpt_flutter/Utils/Models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class ChatBubble extends StatelessWidget {
  final String reply;
  final ChatMessageType? messagetype;
  final bool isImage;

  const ChatBubble({
    super.key,
    required this.reply,
    required this.messagetype,
    required this.isImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* circle avatar
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          backgroundImage: messagetype == ChatMessageType.bot
              ? const AssetImage("assets/chatgpt_icon.jpg")
              : const AssetImage("assets/myprofile.jpg"),
        ),

        const SizedBox(
          width: 5,
        ),

        //* for message
        isImage
            ? Image.network(reply)
            : Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: messagetype == ChatMessageType.bot
                        ? KBotBackgroundColor
                        : KScaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    reply,
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
