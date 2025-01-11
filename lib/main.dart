import 'package:evaluacion_final/screens/bienvenida.dart';
import 'package:evaluacion_final/screens/cuenta.dart';
import 'package:evaluacion_final/screens/transaccion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Bienvenida()
      ),
    );
  }
}
