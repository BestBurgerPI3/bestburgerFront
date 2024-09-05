// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/favourite_widget.dart';
import 'package:lista_productos/Widgets/score_widget.dart';

class ProductItem extends StatelessWidget {
  final String burgerName;
  final int nFavoritos;
  final String burgerPhoto;
  final String burgerDesc;
  final int burgerScore;
  const ProductItem(
      {super.key,
      required this.burgerName,
      required this.nFavoritos,
      required this.burgerPhoto,
      required this.burgerDesc,
      required this.burgerScore});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, '/producto',
            arguments: {
              'burgerName': burgerName,
              'burgerPhoto': burgerPhoto,
              'burgerScore': burgerScore,
              'burgerDesc': burgerDesc
            });
      },
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
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
                offset: Offset(0, 0))
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 27),
        padding: EdgeInsets.only(left: 10, top: 5, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    burgerName,
                    style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  ),
                ),
                FavouriteButton(hSize: 28)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(burgerPhoto),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Score(
                        num: burgerScore,
                        size: 22,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 12),
                          child: Text(
                            "Favoritos: $nFavoritos",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400)),
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
