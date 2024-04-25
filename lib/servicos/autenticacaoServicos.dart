import 'package:firebase_auth/firebase_auth.dart';


class Autenticacaoservicos{
  FirebaseAuth  firebseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario ({
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
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return ("O Usuário já está cadastrado");
      }
      return "Erro desconhecido";
    }
    return "Erro desconhecido";
  }
  Future<String?> logarUsuarios(
      {required email, required senha}) async{
    try{
    await firebseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha);
    return null;
  } on FirebaseAuthException catch(e) {
     return e.message;
    }
    return null;
  }
  Future<void> deslogar() async{
    return firebseAuth.signOut();
  }
}