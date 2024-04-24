import 'package:firebase_auth/firebase_auth.dart';


class Autenticacaoservicos{
  FirebaseAuth  firebseAuth = FirebaseAuth.instance;

  cadastrarUsuario ({
    required  nome,
    required  senha,
    required  email,})async{

    try{
      UserCredential userCredential =
      await firebseAuth.createUserWithEmailAndPassword(email:
      email,
          password: senha
      );
      await userCredential.user!.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        print("O Usuário já está cadastrado");
      }

    }
  }
}