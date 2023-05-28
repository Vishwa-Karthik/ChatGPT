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
                top: 50.0, bottom: 0, right: 80, left: 80),
            child: Image.asset(
              'assets/chat-bot.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //* Tagline
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Text(
              "Lean Back, I'm Intelligent human like manner chatbot.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                letterSpacing: 3,
                color: KTextColor,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Not your regualar AI Chat Bot ",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              letterSpacing: 3,
              color: KTextColor,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //* Tagline
          Text(
            "Open AI ChatGPT III Bot",
            style: GoogleFonts.poppins(
              letterSpacing: 2,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: KTextColor,
            ),
          ),
          const SizedBox(
            height: 80,
          ),

          //* Get STarted button
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(35),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 3,
                shadowColor: Colors.grey,
              ),
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

          const Spacer(
            flex: 2,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Text(
            "Developed by Vishwa Karthik",
            style: GoogleFonts.notoSans(color: Colors.grey, fontSize: 10),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
