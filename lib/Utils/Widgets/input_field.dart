import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget suffixIcon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      style: GoogleFonts.notoSans(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        fillColor: KBotBackgroundColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white30,
        ),
      ),
    );
  }
}
