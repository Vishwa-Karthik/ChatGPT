import 'package:chatgpt_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* logo
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0, bottom: 50, right: 80, left: 80),
            child: Image.asset(
              'assets/chat-bot.png',
              height: 250,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //* Tagline
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Text(
              "Lean Back, I'm Intelligent human like manner chatbot.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 30,
                letterSpacing: 3,
                color: KTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Text(
              "Not your regualar AI Chat Bot ",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 30,
                letterSpacing: 3,
                color: KTextColor,
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //* Tagline
          Text(
            "Open AI Chat Bot",
            style: GoogleFonts.poppins(
              letterSpacing: 2,
              fontSize: 23,
              color: KTextColor,
            ),
          ),
          const Spacer(),

          //* Get STarted button
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(35),
            ),
            child: MaterialButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.notoSerif(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
