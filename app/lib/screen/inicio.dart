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
            Text('Bienvenido a la pantalla de inicio'),
            SizedBox(height: 100),
            Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/cooking.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 100),
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
                'Empezar',
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

  HomeScreen() {}
}
