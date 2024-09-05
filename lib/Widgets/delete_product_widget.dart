import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      color: Color.fromARGB(255, 166, 63, 4),
      icon: FaIcon(FontAwesomeIcons.solidTrashCan),
      onPressed: (){},
    );
  }
}
