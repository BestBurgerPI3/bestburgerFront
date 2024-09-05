// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationExp extends StatelessWidget {
  final String resAddress;
  final String resNumber;
  final String oHour;
  final String cHour;
  const InformationExp(
      {super.key,
      required this.resAddress,
      required this.resNumber,
      required this.cHour,
      required this.oHour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ExpansionTile(
        title: Text(
          "Información",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                TitleText(title: "Dirección", text: resAddress),
                TitleText(title: "Contacto", text: resNumber),
                TitleText(title: "Hora de apertura", text: oHour),
                TitleText(title: "Hora de cierre", text: cHour),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiTexto extends StatelessWidget {
  final String texto;
  final FontWeight fontWeight;

  const MiTexto(
      {super.key, required this.texto, this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  final String text;
  const TitleText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MiTexto(
            texto: "$title:",
            fontWeight: FontWeight.w600,
          ),
          Text(
            " $text",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
