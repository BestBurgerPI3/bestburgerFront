import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouriteButton extends StatefulWidget {
  final double hSize;
  const FavouriteButton({super.key, required this.hSize});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isSolid = false;

  void _toggleIcon() {
    setState(() {
      isSolid = !isSolid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.hSize,
      color: Color.fromARGB(255, 225, 73, 73),
      icon: FaIcon(
        isSolid ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
      ),
      onPressed: _toggleIcon,
    );
  }
}
