// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/comment_box_widget.dart';
import 'package:lista_productos/Widgets/rate_button_widget.dart';
import 'package:lista_productos/Widgets/score_widget.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String burgerName = args['burgerName'];
    final String burgerPhoto = args['burgerPhoto'];
    final String burgerDesc = args['burgerDesc'];
    final int burgerScore = args['burgerScore'];
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      width: screenWidth,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 212, 163),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      )),
                  Center(
                    child: Container(
                      width: screenWidth * 0.8,
                      height: (screenWidth * 0.8) - 40,
                      margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        image: DecorationImage(
                            image: NetworkImage(
                                burgerPhoto),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30),
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
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.only(top: 20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    burgerName,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500)),
                  )),
              Score(num: burgerScore, size: 40),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 15, right: 30),
                  child: Text(
                    burgerDesc,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                  )),
              RateButton(),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    "Calificaciones",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500)),
                  )),
              CommentBox()
            ],
          ),
        ]),
      ),
    );
  }
}
