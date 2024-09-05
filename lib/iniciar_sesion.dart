// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Widgets/input_widget.dart'; // Asegúrate de importar el widget
import '/Widgets/button_widget.dart';
import '/Widgets/text_button_widget.dart';
import 'package:http/http.dart' as http;

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwdController = TextEditingController();

  Future<Map<String, dynamic>> fetchUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('http://74.235.191.229:3011/bestburger/OBTENER-INFORMACION'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar el perfil del usuario');
    }
  }

  Future<String> enviarDatos() async {
    try {
      final response = await http.post(
          Uri.parse('http://74.235.191.229:3011/bestburger/LOGIN_USER'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(<String, String>{
            "Correo": nameController.text,
            "Contraseña": passwdController.text,
          }));

      if (response.statusCode == 200) {
        String token = jsonDecode(response.body)['token'];

        //Decodificar el token y obtener el tipo de usuario.
        Map<String, dynamic> decodedToken = jsonDecode(ascii.decode(
            base64Url.decode(base64Url.normalize(token.split(".")[1]))));
        String tipoUsuario = decodedToken['tipoUsuario'].toString();

        if (tipoUsuario == '2') {
          final userProfile = await fetchUserProfile(token);
          print(userProfile);
          print('ok resto');

          Navigator.pushNamed(context, '/restaurante',
              arguments: {'userProfile': userProfile});

          return 'ok resto';
        }

        print('ok cliente');
        return 'ok cliente';
      } else if (response.statusCode == 401) {
        String message = jsonDecode(response.body)['error'];
        print(message);
        return message;
      } else {
        return 'Ocurrió un error inesperado';
      }
    } catch (e) {
      print("Error en enviarDatos: $e");
      return 'Error: $e';
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
                          "INICIAR SESIÓN",
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
                    InputWidget(
                      label: "Correo:",
                      controller: nameController,
                    ),
                    InputWidget(
                      label: "Contraseña:",
                      controller: passwdController,
                      obscureText: true,
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: CustomButton(
                        text: "Iniciar Sesión",
                        onPressed: enviarDatos,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextWithButtonWidget(
                          text: "¿No tienes cuenta?",
                          buttonText: "Registrate",
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
