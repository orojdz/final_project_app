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
              'Lets cook!',
              style: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 233, 130, 50)),
            ),
            SizedBox(height: 30),
            Container(
                width: 300,
                height: 300,
                child: Image.asset(
                  'images/foodie.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 30),
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
                  fontSize: 25,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
