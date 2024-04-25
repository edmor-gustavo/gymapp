import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/modal_inicio.dart';
import 'package:flutter_gymapp/servicos/autenticacaoServicos.dart';
import 'package:flutter_gymapp/tela/primeira_tela.dart';
import '../model/Exercicio_modelo.dart';

class Iniciotela extends StatefulWidget {
  final User user;
   Iniciotela({Key? key, required this.user}) : super(key: key);

  @override
  State<Iniciotela> createState() => _IniciotelaState();
}

class _IniciotelaState extends State<Iniciotela> {
  final List<ExercicioModelo> listaExerciocios = [
   ExercicioModelo(
   id: "EX01",
   nome:"LegDay",
   treino: "Treino A",
   comoFazer: " Pize a barra e empurra"),

   ExercicioModelo(
   id: "EX02",
   nome:"Mosculação",
   treino: "Treino B",
   comoFazer: " Segura a barra e puxa"),
   ExercicioModelo(
   id: "EX03",
   nome:"Flexões",
   treino: "Treino C",
   comoFazer: " Coloque a mão sobre o chão e faça sobe e desce "),

    ExercicioModelo(
   id: "EX04",
   nome:"LegDay",
   treino: "Treino D",
   comoFazer: " Segura a barra e puxa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Exercícios"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/user.png")
              ),
              accountName:Text (widget.user.displayName!),
              accountEmail: Text(widget.user.email!),
          ),

          ListTile(
        leading:const Icon(Icons.logout),
          title:const Text("Deslogar"),
           onTap:() {
            Autenticacaoservicos().deslogar();
        }

           )
        ],
  ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          mostrarModalInicio(context);
        },
      ),

      body: ListView(children: List.generate(listaExerciocios.length, (index){
        ExercicioModelo exercicioModelo = listaExerciocios[index];
          return  ListTile(
            title: Text(exercicioModelo.nome),
            subtitle: Text(exercicioModelo.treino),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) =>
              PrimeiraTela(exercicioModelo:exercicioModelo ,)
                ),
              );
             },

          );
         },
        ),
       ) ,
     );
    }
}
