// ignore_for_file: prefer_const_constructors
import 'dart:convert'; // Para manejar JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/button_widget.dart';
import 'package:lista_productos/Widgets/text_button_widget.dart';

import 'Widgets/input_widget.dart';

class RegistroRestaurant extends StatefulWidget {
  const RegistroRestaurant({super.key});

  @override
  State<RegistroRestaurant> createState() => _RegistroRestaurantState();
}

class _RegistroRestaurantState extends State<RegistroRestaurant> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nitController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController closeController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  bool showInitialFields = true;

  Future<void> registerUser() async {
    final url =
        Uri.parse('http://74.235.191.229:3011/bestburger/REGISTER_USER');

    int? nitValue = int.tryParse(nitController.text);

    final body = jsonEncode({
      "Nombre": nameController.text,
      "Correo": emailController.text,
      "Contraseña": confirmPasswordController.text,
      "Nombre_Usuario": nameController.text,
      "TipoUsuario": 2,
      "Imagen": 1,
      "NIT": nitValue,
      "Direccion": addressController.text,
      "Telefono": telController.text,
      "Hora_Apertura": openController.text,
      "Hora_Cierre": closeController.text,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Registro completado exitosamente."),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error al completar el registro."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ocurrió un error al realizar el registro."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 166, 63, 4),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                margin: EdgeInsets.only(top: 8, bottom: 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://drive.google.com/uc?export=view&id=1FtVfjo7Uv_ImiKF50AeuE4ywb8BMwFsg')),
                ),
              ),
              Container(
                width: screenWidth,
                height: 750,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Center(
                        child: Text(
                          "REGISTRATE",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    if (showInitialFields) ...[
                      InputWidget(
                        label: "Nombre Restaurante:",
                        controller: nameController,
                      ),
                      InputWidget(
                        label: "NIT:",
                        controller: nitController,
                      ),
                      InputWidget(
                        label: "Correo:",
                        controller: emailController,
                      ),
                      InputWidget(
                        label: "Contraseña:",
                        controller: passwordController,
                        obscureText: true,
                      ),
                      InputWidget(
                        label: "Confirmar Contraseña:",
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                    ],
                    if (!showInitialFields) ...[
                      InputWidget(
                        label: "Direccion:",
                        controller: addressController,
                      ),
                      InputWidget(
                        label: "Telefono:",
                        controller: telController,
                      ),
                      InputWidget(
                        label: "Hora Apertura:",
                        controller: openController,
                        isTimePicker: true,
                      ),
                      InputWidget(
                        label: "Hora Cierre:",
                        controller: closeController,
                        isTimePicker: true,
                      ),
                      // InputWidget(
                      //   label: "Foto:",
                      //   controller: photoController,
                      // ),
                      SizedBox(height: 30),
                    ],
                    Center(
                      child: CustomButton(
                        text: showInitialFields
                            ? "Continuar Registro"
                            : "Completar Registro",
                        onPressed: () {
                          if (showInitialFields) {
                            if (nameController.text.isEmpty ||
                                nitController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Por favor, complete todos los campos.",
                                  ),
                                  backgroundColor: Colors.red[600],
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else if (confirmPasswordController.text !=
                                passwordController.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Las contraseñas no coinciden"),
                                backgroundColor: Colors.red[600],
                                duration: Duration(seconds: 2),
                              ));
                            } else {
                              setState(() {
                                showInitialFields = false;
                              });
                            }
                          } else {
                            if (addressController.text.isEmpty ||
                                telController.text.isEmpty ||
                                closeController.text.isEmpty ||
                                openController.text.isEmpty /*||
                                photoController.text.isEmpty*/) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Por favor, complete los nuevos campos.",
                                  ),
                                  backgroundColor: Colors.red[600],
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              registerUser();
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextWithButtonWidget(
                          text: "¿Ya tienes cuenta?",
                          buttonText: "Inicia Sesión",
                          onButtonPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
