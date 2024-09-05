// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lista_productos/Widgets/banner_image_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_productos/Widgets/information_expansion_widget.dart';
import '/Widgets/product_item_widget.dart';
import '/Widgets/score_widget.dart';
import '/Widgets/search_bar_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  Future<List<ProductItem>>? _futureHamburguesas;

  @override
  void initState() {
    super.initState();
    _futureHamburguesas = _consultarHamburguesas();
  }

  Future<List<ProductItem>> _consultarHamburguesas() async {
    String sUrl =
        "http://74.235.191.229:3011/bestburger/hamburguesas"; 

    try {
      final response = await http.post(
        Uri.parse(sUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
        'nit': 123456789
      })
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        return data.map<ProductItem>((item) {
          return ProductItem(
            burgerName: item["Nombre"],
            nFavoritos: item["Calificacion"],
            burgerScore: item["Calificacion"],
            burgerDesc: item["Descripcion"],
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerImg(),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                "Donde Luigi JR",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w500)),
              ),
            ),
            Score(num: 4),
            InformationExp(
              resAddress: "Avda. Bucaros Oeste #3-113 Local 21",
              resNumber: "3184204619",
              oHour: "12:15 PM",
              cHour: "11:30 PM",
            ),
            Searchbar(),
            Expanded(
              child: FutureBuilder<List<ProductItem>>(
                future: _futureHamburguesas,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ProductItem>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView(
                      children: snapshot.data!,
                    );
                  } else {
                    return Center(
                        child: Text('No hay hamburguesas disponibles'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
