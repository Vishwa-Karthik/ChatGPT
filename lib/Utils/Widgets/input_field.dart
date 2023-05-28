import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget suffixIcon;
  final FocusNode? focusNode;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      focusNode: focusNode,
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
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        alignLabelWithHint: true,
        hintStyle: const TextStyle(
          color: Colors.white30,
        ),
      ),
    );
  }
}
