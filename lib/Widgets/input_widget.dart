// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isTimePicker;
  final bool obscureText;

  const InputWidget({
    super.key,
    required this.label,
    required this.controller,
    this.isTimePicker = false,
    this.obscureText = false
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final String formattedTime = picked.format(context);
      controller.text = formattedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
          Container(
            width: screenWidth * 0.82,
            height: 45,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(boxShadow: [
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
            ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              readOnly:
                  isTimePicker, // Hace el campo no editable si es un TimePicker
              onTap: isTimePicker
                  ? () {
                      _selectTime(
                          context); // Abre el TimePicker si isTimePicker es true
                    }
                  : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 16),
                hintText: isTimePicker ? "Selecciona la hora" : "",
              ),
            ),
          )
        ],
      ),
    );
  }
}
