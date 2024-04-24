import 'package:flutter/cupertino.dart' show BorderRadius, BoxDecoration, BuildContext, Color, Column, Container, CrossAxisAlignment, EdgeInsets, FontWeight, Icon, ListView, MainAxisAlignment, Padding, Radius, RoundedRectangleBorder, Row, SizedBox, StatelessWidget, Text, TextStyle, Widget;
import 'package:flutter/material.dart';
import '../_comum/_minhas_cores.dart';
import '../model/Exercicio_modelo.dart';
import '../model/Sentimento_modelo.dart';

class PrimeiraTela extends StatelessWidget {

  final ExercicioModelo exercicioModelo;
  PrimeiraTela({super.key, required this.exercicioModelo});

  final List<SentimentoModelo> listSentimento =[
    SentimentoModelo(id:"SE01",
        sentindo: " Pouca Ativação",
        data: "2024-04-19"),

    SentimentoModelo(id:"SE02",
        sentindo: " Um pouco de Activação",
        data: "2024-04-19"),

    SentimentoModelo(id:"SE02",
        sentindo: " Já sinto Muita activaçãoo",
        data: "2024-04-19"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,


        appBar: AppBar(
          title: Column(children: [
            Text(exercicioModelo.nome,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:22
              ),
            ),
            Text(exercicioModelo.treino,
              style:const TextStyle(
                  fontSize: 14
              ),
            ),
          ],),
          centerTitle: true,
          backgroundColor: MinhasCores.azulEscuro,
          elevation: 0,
          toolbarHeight: 72,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32)
              )
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
        },
          child: const Icon(Icons.add),
        ),

        body:
        Container(
          margin: const EdgeInsets.all(8),//borda de dentro para fora
          padding: const EdgeInsets.all(16.0),//borda de fora para dentro
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
          ) ,
          child: ListView(
            children: [
              SizedBox(
                height:250 ,// altura para o tamanho da foto
                child: Row( // cercar o Elevate com um row
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: (){},// clicar sobre o elevateB.
                        // e cercar ele com SizeBoz, para dar tamanho a foto
                        child:const Text("Enviar foto")
                    ),
                    ElevatedButton(onPressed:(){}, child: const Text("Tirar foto")),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const Text("Como Fazer?", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),

              Text(exercicioModelo.comoFazer
              ),
              const Padding( // clicar sobre o divider, ir na lampada e cercar com padding e adicionar o costa
                padding:  EdgeInsets.all(8.0),
                child:  Divider(color: Colors.black,),
              ),
              const Text("Como Me Sinto?", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(listSentimento.length, (index) {
                  SentimentoModelo sentimentoAgora = listSentimento[index];

                  return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(sentimentoAgora.sentindo),
                      subtitle: Text(sentimentoAgora.data),
                      leading: const Icon(Icons.double_arrow_rounded),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: ()
                        {
                          print("DELETAR ${sentimentoAgora.sentindo}");
                        },)
                  );

                }),
              )
            ],
          ),
        )
    );
  }
}
