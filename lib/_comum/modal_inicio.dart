import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/_minhas_cores.dart';
import 'package:flutter_gymapp/comoponents/declaracao_campo_autenticacao.dart';

mostrarModalInicio(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: MinhasCores.azulEscuro,
      isDismissible: false,
      isScrollControlled: true,
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(32)
          ),
      ),
      builder:(context){
        return const ExercicioModal();
      }
  );
}
class ExercicioModal extends StatefulWidget {
  const ExercicioModal({Key? key}) : super(key: key);

  @override
  State<ExercicioModal> createState() => _ExercicioModalState();
}

class _ExercicioModalState extends State<ExercicioModal> {
  TextEditingController _nomeControl = TextEditingController();
  TextEditingController _treinoControl = TextEditingController();
  TextEditingController _anotacoesControl = TextEditingController();
  TextEditingController _sentindoControl = TextEditingController();

  bool isCarregando = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(32),
      height: MediaQuery.of(context).size.height * 0.9,
      child:Form(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
                mainAxisSize: MainAxisSize.min ,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Adicionar Exercicio", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: const Icon(
                          Icons.close,
                        color: Colors.white,
                        ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nomeControl ,
                      decoration: getAutenticationInputDecoration(
                          "Qual o nome do Exercício"
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _treinoControl ,
                      decoration: getAutenticationInputDecoration(
                          "Qual treino pertence"
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _anotacoesControl ,
                      decoration: getAutenticationInputDecoration(
                          "Faça as suas anotações"
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _sentindoControl ,
                      decoration: getAutenticationInputDecoration(
                          "Como você está se sentindo"
                      ),
                      maxLines: null,
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(onPressed: (){},
                child: (isCarregando)?
                    const SizedBox(
                      height: 16,
                      width:16,
                      child: CircularProgressIndicator(
                        color: MinhasCores.azulEscuro,
                      ),
                    ):
            const Text("Criar Exercício")
            )
          ],
        )
        ),
    );
  }
}
