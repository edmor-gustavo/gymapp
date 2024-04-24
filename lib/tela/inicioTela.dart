import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gymapp/servicos/autenticacaoServicos.dart';

class Iniciotela extends StatelessWidget {
  const Iniciotela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Inicial"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
        leading:const Icon(Icons.logout),
          title:const Text("Deslogar"),
           onTap:() {
            Autenticacaoservicos().deslogar();     }

           )
        ],
  ),
      ),
    );
  }
}
