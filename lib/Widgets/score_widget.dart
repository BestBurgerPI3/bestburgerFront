// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Score extends StatelessWidget {
  final int num;
  final double size;
  final EdgeInsets scorePadding;
  const Score({super.key, required this.num, this.size = 32, this.scorePadding= const EdgeInsets.only(left: 10, top: 5)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: scorePadding,
      child: Row(
          children: List.generate(
        5,
        (index) => FaIcon(FontAwesomeIcons.burger,
            size: size,
            color: index < num
                ? Color.fromARGB(255, 242, 159, 5)
                : Color.fromARGB(255, 192, 192, 192)),
      )),
    );
  }
}
