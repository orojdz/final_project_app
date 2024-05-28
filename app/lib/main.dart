import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app/screen/inicio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Punto de entrada de la aplicación
void main() async {
  // Importat variables de entorno
  await dotenv.load(fileName: ".env");

  // Inicialización Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets eat!',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: InicioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
