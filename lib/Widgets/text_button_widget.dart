// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithButtonWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const TextWithButtonWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: GoogleFonts.montserrat(textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255,73,73,73),
          )),
        ),
        TextButton(
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: GoogleFonts.montserrat(textStyle:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 166, 63, 4), 
            )),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero
          ),
        ),
      ],
    );
  }
}
