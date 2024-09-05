import 'package:flutter/material.dart';
import 'package:lista_productos/iniciar_sesion.dart';
import 'package:lista_productos/producto.dart';
import 'package:lista_productos/registroRestaurante.dart';
import 'lista.dart';
import 'restaurant_main_page.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/lista': (context) => Lista(),
        '/producto': (context) => ProductView(),
        '/restaurante': (context) => RestaurantMainPage(),
        '/registro': (context)=> RegistroRestaurant(),
        '/login': (context) => IniciarSesion()
      },
      initialRoute: '/login',
    );
  }
}
