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
    return Container(
        child: messagetype == ChatMessageType.bot
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //* circle avatar
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.teal,
                    backgroundImage: messagetype == ChatMessageType.bot
                        ? const AssetImage("assets/chatgpt_icon.jpg")
                        : const AssetImage("assets/myprofile.jpg"),
                  ),

                  //* for message
                  isImage
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              reply,
                            ),
                          ),
                        )
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
                              textAlign: TextAlign.end,
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
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //* for message
                  Expanded(
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
                        textAlign: TextAlign.end,
                        reply,
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  //* circle avatar
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.teal,
                    backgroundImage: messagetype == ChatMessageType.bot
                        ? const AssetImage("assets/chatgpt_icon.jpg")
                        : const AssetImage("assets/myprofile.jpg"),
                  ),
                ],
              ));
  }
}
