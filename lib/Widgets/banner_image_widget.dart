// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BannerImg extends StatelessWidget {
  const BannerImg({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const netImage = 'https://drive.google.com/uc?export=view&id=1RpfMJzzUWHqmqFUhLKebZ7dS2kIbiHi_';

    return Container(
        height: 220,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
            image: DecorationImage(
                image: NetworkImage(
                    netImage),
                fit: BoxFit.cover)));
  }
}
