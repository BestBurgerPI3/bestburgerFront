// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/delete_product_widget.dart';
import 'package:lista_productos/Widgets/edit_product_widget.dart';

class RestaurantProductItem extends StatelessWidget {
  final String burgerName;
  final String burgerPhoto;

  const RestaurantProductItem({
    super.key,
    required this.burgerName,
    required this.burgerPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 27),
      padding: EdgeInsets.only(left: 10, top: 16, right: 16, bottom: 16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(burgerPhoto), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12,left: 7),
                        child: Text(
                          burgerName,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    DeleteButton()
                  ],
                ),
                EditButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
