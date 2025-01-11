import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Transaccion extends StatefulWidget {
  const Transaccion({super.key});

  @override
  State<Transaccion> createState() => _TransaccionState();
}

class _TransaccionState extends State<Transaccion> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref(); // Usando la referencia directa
  final TextEditingController benefeciarioC = TextEditingController();
  final TextEditingController montoC = TextEditingController();
  
  // Crear FocusNode para manejar el enfoque
  final FocusNode _beneficiarioFocusNode = FocusNode();
  final FocusNode _montoFocusNode = FocusNode();

  @override
  void dispose() {
    _beneficiarioFocusNode.dispose();
    _montoFocusNode.dispose();
    benefeciarioC.dispose();
    montoC.dispose();
    super.dispose();
  }

  void guardarTransaccion() {
    final String beneficiario = benefeciarioC.text;
    final String monto = montoC.text;

    if (beneficiario.isNotEmpty && monto.isNotEmpty) {
      // Validar que el monto sea un número
      double? montoValor = double.tryParse(monto);
      if (montoValor == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Por favor, ingrese un monto válido"),
        ));
        return;
      }

      final transaccion = {
        'beneficiario': beneficiario,
        'monto': montoValor,
      };

      // Guardar en Firebase usando la referencia directa
      ref.child('transacciones').push().set(transaccion).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Transacción guardada con éxito"),
        ));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error al guardar la transacción"),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Por favor, complete todos los campos"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 152, 209),
        title: Text(
          "Ingrese la transacción",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Campo para el beneficiario
              TextFormField(
                controller: benefeciarioC,
                focusNode: _beneficiarioFocusNode, // Asignar FocusNode
                autofocus: true, // Activar autofocus para el campo inicial
                decoration: InputDecoration(
                  labelText: "Beneficiario",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),
              SizedBox(height: 20),
              // Campo para el monto
              TextFormField(
                controller: montoC,
                focusNode: _montoFocusNode, // Asignar FocusNode
                decoration: InputDecoration(
                  labelText: "Monto a transferir",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 20),
              // Botón para guardar la transacción
              ElevatedButton(
                onPressed: guardarTransaccion,
                child: Text("Guardar transacción"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 233, 152, 209),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
