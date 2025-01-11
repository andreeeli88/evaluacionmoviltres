import 'dart:convert';

import 'package:flutter/material.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(150, 243, 127, 166),
        title: Center(
          child: Text("Cuenta de ahorros",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          ),
          ),
          
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tu saldo es de:"),
              Expanded(child: lista2(context))
            ],
          ),
          ),

      ),
    );
  }
}
Future <List> leerJsonLocal(context) async {
  final String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/transacciones.json");

  return json.decode(jsonString);
}
Widget lista2(context){
  return FutureBuilder(future: leerJsonLocal(context), builder: (context, snapshot){
    if(snapshot.hasData){
      final data = snapshot.data!;
      return ListView.builder( itemCount: data.length , itemBuilder: (context, index){
        final item = data[index];
        return ListTile(
          onTap: () => alerta(context, item),
          title: Text("${item['beneficiario']}"),
          
        );
      });
    }else{
      return Text("Data no encontrada");
    }
  });

}
void alerta(context, item){
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text("Detalles"),
      content: Column(
        children: [
          Text("${item['beneficiario']}"),
          
          Text("${item['monto']}"),
          Text("${item['fecha']}"),
          Text("${item['id']}")
        ],
      ),
    );
  });
}