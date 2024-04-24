import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/meu_snkbar.dart';
import 'package:flutter_gymapp/servicos/autenticacaoServicos.dart';

import '../_comum/_minhas_cores.dart';
import '../comoponents/declaracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  Autenticacaoservicos autenServic = Autenticacaoservicos();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView (
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/ginasio.png",height: 128,
                      ),
                      const Text(
                        "GymEdmor",
                        textAlign: TextAlign.center ,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 32,),
                      TextFormField(
                        controller: emailController,
                        decoration:getAutenticationInputDecoration("Email"),
                        validator: (String? value) {
                          if(value == null){
                            return "O e-mail não pode ser vazio";
                          }
                          if(value.length < 5 ) {
                            return "O e-mail é muito curto";
                          }
                          if(!value.contains("@")){
                            return "O e-mail não é válido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: senhaController,
                        decoration: getAutenticationInputDecoration("Senha"),
                        validator: (String? value) {
                          if(value == null){
                            return "A  senha não pode ser vazio";
                          }
                          if(value.length < 5 ) {
                            return "A  senha é muito curta";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      Visibility(visible:!queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(decoration:getAutenticationInputDecoration("Confirme Senha"),
                              validator: (String? value) {
                                if(value == null){
                                  return "A confirmação de senha não pode ser vazio";
                                }
                                if(value.length < 5 ) {
                                  return "A confirmação de Senha é muito curto";
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: nomeController,
                              decoration:getAutenticationInputDecoration("Escreva o Nome"),
                              validator: (String? value) {
                                if(value == null){
                                  return "O nome não pode ser vazio";
                                }
                                if(value.length < 3 ) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],

                        ) ,
                      ),
                      const SizedBox(height: 16,
                      ),
                      ElevatedButton(onPressed: (){
                        botaoPrincipalClicado();
                      },
                        child: Text((queroEntrar)?"Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text((queroEntrar)?"Ainda não tem uma conta? Cadastra-se!":
                        "Já tem uma conta? Entre!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );

  }
  botaoPrincipalClicado(){
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
      } else {
        print("Cadastro Validado");
        print("${emailController.text},"
            "${senhaController.text}, "
            "${nomeController.text}");
        autenServic.cadastrarUsuario(
            nome: nome,
            senha: senha,
            email: email).then((String? erro) {
              if(erro != null){
                mostrarSnackBar(context: context, texto: erro);
              }else{
                mostrarSnackBar(context: context, texto: "Cadastro efectuado com sucesso ",
                isErro:false);
              }
              },
        );
      }
    }else{
      print("Form Inválido");
    }
  }
}



