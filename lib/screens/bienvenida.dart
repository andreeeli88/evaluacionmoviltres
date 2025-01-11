import 'package:evaluacion_final/screens/login.dart';
import 'package:evaluacion_final/screens/registro.dart';
import 'package:flutter/material.dart';


class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 117, 147), 
        title: Center(
          child: Text(
            "Bienvenido",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              login_btn(context),
              SizedBox(height: 15),  // Espaciado entre los botones
              registro_btn(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget login_btn(BuildContext context) {
  return Container(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 85, 228, 213), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        padding: EdgeInsets.symmetric(vertical: 15), 
        elevation: 5, 
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ),
      label: Text(
        "Iniciar sesión",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white, 
        ),
      ),
      icon: Icon(
        Icons.account_circle,
        color: Colors.white, 
      ),
    ),
  );
}

Widget registro_btn(BuildContext context) {
  return Container(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 138, 92, 128), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        padding: EdgeInsets.symmetric(vertical: 15), 
        elevation: 5, 
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      ),
      label: Text(
        "Registrarse",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white, 
        ),
      ),
      icon: Icon(
        Icons.account_circle_outlined,
        color: Colors.white, 
      ),
    ),
  );
}