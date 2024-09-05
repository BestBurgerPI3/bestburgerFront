// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.65,
      margin: EdgeInsets.only(left: 10, top: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4)),
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1))
        ],
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 166, 63, 4),
            padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(FontAwesomeIcons.plus, color: Colors.white, size: 24),
            Text(
              "Agregar Producto",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
