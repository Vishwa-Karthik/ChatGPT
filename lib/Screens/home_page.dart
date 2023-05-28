// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatgpt_flutter/Error%20Handling/snack_bar.dart';
import 'package:chatgpt_flutter/Utils/Widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../service/api_Service.dart';
import '../Utils/Models/chat_model.dart';
import '../Utils/Widgets/input_field.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//* Chat SCreen Instances

  //* keyboard focus node
  late FocusNode focusNode;

  //* loading screen
  late bool isLoading;

  var scrollController = ScrollController();

  //* list to hold Text type of message
  final List<ChatMessage> messages = [];

  //* text controller to enter messgae
  final TextEditingController _controller = TextEditingController();

  //* initilise loadding to false
  @override
  void initState() {
    super.initState();
    isLoading = false;
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  scrollMethod() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

//* Audio Button
  //* var audioText
  var audioText = "  Type or Speak ";

  //* ui action bool value
  var isListening = false;

  //* object of TTS package
  SpeechToText speechToText = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //* backgroud Color
      backgroundColor: KScaffoldBackgroundColor,

      //* App bar
      appBar: AppBar(
        backgroundColor: KAppBackgroundColor,
        title: Text(
          "OpenAI  ChatGPT III",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),

      //* Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                //* chat screen
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 10),
                      reverse: true,
                      controller: scrollController,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, index) {
                        var chat = messages[index];
                        return ChatBubble(
                          reply: chat.text.toString(),
                          messagetype: chat.type,
                          isImage: chat.isImage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            //* loading screen
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Center(
                child: Visibility(
                  visible: isLoading,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),

            //* text field & submit method
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* chat field
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: MyTextField(
                        focusNode: focusNode,
                        controller: _controller,
                        hintText: audioText,
                        suffixIcon: mySubmitButton(),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    //* Generate Image Button
                    myImageGen(),

                    const SizedBox(
                      width: 10,
                    ),

                    //* audio button
                    myMicButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myImageGen() {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.image,
          color: Colors.black,
          size: 24,
        ),
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            //* display user input
            setState(() {
              messages.insert(
                0,
                ChatMessage(
                  text: _controller.text,
                  type: ChatMessageType.user,
                  isImage: false,
                ),
              );
              isLoading = true;
            });
            var input = _controller.text;
            _controller.clear();

            //* scroll to bottom
            Future.delayed(const Duration(milliseconds: 50))
                .then((value) => scrollMethod());

            //* call chatbot api
            ApiService.generateImg(input).then((value) {
              setState(() {
                messages.insert(
                  0,
                  ChatMessage(
                      text: value, type: ChatMessageType.bot, isImage: true),
                );
                isLoading = false;
              });

              //* scroll to bottom
              Future.delayed(const Duration(milliseconds: 50))
                  .then((value) => scrollMethod());
            });
          } else {
            showErrorToast(context, "Enter a message to generate image");
          }
        },
      ),
    );
  }

  //* Submit Button
  Widget mySubmitButton() {
    return Visibility(
      visible: !isLoading,
      child: Container(
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                //* display user input
                setState(() {
                  messages.insert(
                    0,
                    ChatMessage(
                      text: _controller.text,
                      type: ChatMessageType.user,
                      isImage: false,
                    ),
                  );
                  isLoading = true;
                  focusNode.unfocus();
                });
                var input = _controller.text;
                _controller.clear();

                Future.delayed(const Duration(milliseconds: 50))
                    .then((value) => scrollMethod());

                //* call chatbot api
                ApiService.sendMessage(input).then((value) {
                  setState(() {
                    isLoading = false;
                    messages.insert(
                        0,
                        ChatMessage(
                          text: value,
                          type: ChatMessageType.bot,
                          isImage: false,
                        ));
                  });
                });

                //* clear controller
                _controller.clear();
                Future.delayed(const Duration(milliseconds: 50))
                    .then((value) => scrollMethod());
              } else {
                showErrorToast(context, "Please enter a message");
              }
            },
          )),
    );
  }

  //* Audio Button
  Widget myMicButton() {
    return InkWell(
      onTapDown: (_) async {
        HapticFeedback.vibrate();
        if (!isListening) {
          try {
            //* check if you can listen to audio -> return bool value
            bool avail = await speechToText.initialize();

            if (avail) {
              setState(() {
                isListening = true;

                //* start listening and append result to var
                speechToText.listen(onResult: (res) {
                  setState(() {
                    audioText = res.recognizedWords;
                  });
                });
              });
            } else {
              showErrorToast(context, "Permission not granted");
            }
          } catch (e) {
            showErrorToast(context, "No Microphone found");
          }
        }
      },
      onTapUp: (details) async {
        HapticFeedback.vibrate();
        setState(() {
          isListening = false;
          isLoading = true;
          _controller.clear();
        });

        //* stop listening once tapped away from screen
        speechToText.stop();

        //* add the recorded message to list
        messages.insert(
            0,
            ChatMessage(
                text: audioText, type: ChatMessageType.user, isImage: false));

        //* call api SErvice
        var msg = await ApiService.sendMessage(audioText);

        //* store bot's reply into message list
        setState(() {
          messages.insert(
              0,
              ChatMessage(
                  text: msg, type: ChatMessageType.bot, isImage: false));
          isLoading = false;
          _controller.clear();
        });
      },
      child: AvatarGlow(
        endRadius: 22.0,
        animate: isListening ? true : false,
        duration: const Duration(milliseconds: 2000),
        repeat: true,
        glowColor: Colors.white30,
        showTwoGlows: true,
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white30,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isListening ? Icons.mic : Icons.mic_off,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}
