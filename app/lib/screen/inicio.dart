import 'package:flutter/material.dart';
import 'package:app/screen/home.dart';

// Pantalla de inicio
class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lets eat!',
              style: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 40),
            Container(
                width: 280,
                height: 280,
                child: Image.asset(
                  'images/foodie.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 239, 145, 73)),
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize:
                      18, // Cambia el tamaño de la fuente del texto del botón
                  fontFamily: 'Arial', // Cambia la fuente del texto del botón
                  fontWeight: FontWeight
                      .bold, // Cambia el peso de la fuente del texto del botón
                  color: Colors.black, // Cambia el color del texto del botón
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
