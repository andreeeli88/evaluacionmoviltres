import 'package:evaluacion_final/screens/cuenta.dart';
import 'package:evaluacion_final/screens/transaccion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 152, 209),
        title: const Text(
          "Iniciar sesión",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 160, 117, 147),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                ),
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isNotEmpty && password.isNotEmpty) {
                    try {
                     
                      await loginUser(email, password);

                      
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Cuenta()),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Bienvenido, $email")),
                      );
                    } catch (e) {
                     
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: $e")),
                      );
                    }
                  } else {
                    // Mostrar mensaje si los campos están vacíos
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Por favor, completa los campos")),
                    );
                  }
                },
                child: const Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> loginUser(String correo, String pass) async {
  try {
   
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: correo,
      password: pass,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw 'No se encontró un usuario con ese correo electrónico';
    } else if (e.code == 'wrong-password') {
      throw 'Contraseña incorrecta para ese usuario';
    } else {
      throw 'Error desconocido: ${e.message}';
    }
  }
}
