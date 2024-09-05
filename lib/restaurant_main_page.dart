// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_productos/Widgets/add_product_widget.dart';
import 'package:lista_productos/Widgets/banner_image_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/information_expansion_widget.dart';
import 'package:lista_productos/Widgets/restaurant_product_widget.dart';
import 'package:lista_productos/Widgets/search_bar_widget.dart';

class RestaurantMainPage extends StatefulWidget {
  const RestaurantMainPage({super.key});

  @override
  State<RestaurantMainPage> createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  Future<List<RestaurantProductItem>>? _futureHamburguesas;
  late int nit;

  @override
  void initState() {
    super.initState();
  }

  Future<List<RestaurantProductItem>> _consultarHamburguesas(int nit) async {
    String sUrl = "http://74.235.191.229:3011/bestburger/hamburguesas";

    try {
      final response = await http.post(Uri.parse(sUrl),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, int>{'nit': nit}));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        return data.map<RestaurantProductItem>((item) {
          print(item);
          return RestaurantProductItem(
            burgerName: item["Nombre"],
            burgerPhoto: '',
          );
        }).toList();
      } else {
        throw Exception('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (e) {
      print("ERROR AL ENVIAR/RECIBIR SOLICITUD:");
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map<String, dynamic> userProfile = args['userProfile'];
    final Map<String, dynamic> info = userProfile['info'];
    nit = info['NIT'];
    final String nombreRestaurante = info['Nombre'];
    final String direccion = info['Direccion'];
    final String telefono = info['Telefono'];
    final String horaApertura = info['Hora_Apertura'];
    final String horaCierre = info['Hora_Cierre'];

    _futureHamburguesas = _consultarHamburguesas(nit);

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerImg(),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: Text(
                    nombreRestaurante,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500)),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.solidPenToSquare,
                  size: 25,
                )
              ],
            ),
          ),
          InformationExp(
              resAddress: direccion,
              resNumber: telefono,
              cHour: horaApertura,
              oHour: horaCierre),
          Searchbar(),
          AddButton(),
          Expanded(
            child: FutureBuilder<List<RestaurantProductItem>>(
              future: _futureHamburguesas,
              builder: (BuildContext context,
                  AsyncSnapshot<List<RestaurantProductItem>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView(
                    children: snapshot.data!,
                  );
                } else {
                  return Center(child: Text('No hay hamburguesas disponibles'));
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
