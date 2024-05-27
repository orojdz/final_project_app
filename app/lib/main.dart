import 'package:flutter/material.dart';
import 'package:app/screen/inicio.dart';
import 'package:app/screen/home.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets eat!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InicioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
