import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gymapp/tela/autenticacao_tela.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gymapp/tela/inicioTela.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: RoteadorTela()
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot)  {
          if(snapshot.hasData){
            return  Iniciotela(user: snapshot.data!,);
          }else{
            return const AutenticacaoTela();
          }
        }
    );
  }
}

