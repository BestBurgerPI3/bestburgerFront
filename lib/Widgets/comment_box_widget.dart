// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/score_widget.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
              offset: Offset(0, -1))
        ],
      ),
      padding: EdgeInsets.only(left: 14, top: 10, right: 21, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://drive.google.com/uc?export=view&id=1DlUAe9yMcaNB6dBZNe7pplu26iVVan2t'))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Zzits",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth,
            height: 1.5,
            color: Colors.black,
            margin: EdgeInsets.only(top: 8),
          ),
          Row(
            children: [
              Score(
                num: 3,
                size: 18,
                scorePadding: EdgeInsets.only(left: 0, top: 5),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 15),
                child: Text(
                  "Domicilio",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec erat rutrum.",
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
