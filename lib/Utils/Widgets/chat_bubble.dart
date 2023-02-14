import 'package:animated_text_kit/animated_text_kit.dart';
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
                    radius: 20,
                    backgroundColor: Colors.teal,
                    backgroundImage: messagetype == ChatMessageType.bot
                        ? const AssetImage("assets/chatgpt_icon.jpg")
                        : const AssetImage("assets/myprofile.jpg"),
                  ),

                  const SizedBox(width: 5),

                  //* for replies
                  isImage
                      ? Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: messagetype == ChatMessageType.bot
                                ? KBotBackgroundColor
                                : KScaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Row(
                              children: [
                                //* for image
                                FadeInImage(
                                  placeholder: const NetworkImage(
                                    "https://media.giphy.com/media/xTkcEQACH24SMPxIQg/giphy.gif",
                                  ),
                                  image: NetworkImage(
                                    reply,
                                  ),
                                  fit: BoxFit.contain,
                                ),

                                //* for features
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //* download button
                                    IconButton(
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),

                                    //* share button
                                    IconButton(
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 18),
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
                            child: DefaultTextStyle(
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: false,
                                isRepeatingAnimation: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(reply),
                                ],
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
                    radius: 20,
                    backgroundColor: Colors.teal,
                    backgroundImage: messagetype == ChatMessageType.bot
                        ? const AssetImage("assets/chatgpt_icon.jpg")
                        : const AssetImage("assets/myprofile.jpg"),
                  ),
                ],
              ));
  }
}
