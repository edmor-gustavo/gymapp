import 'package:firebase_auth/firebase_auth.dart';


class Autenticacaoservicos{
  FirebaseAuth  firebseAuth = FirebaseAuth.instance;

  cadastrarUsuario ({
    required  nome,
    required  senha,
    required  email,})async{
   UserCredential userCredential = await firebseAuth.createUserWithEmailAndPassword(email:
   email,
       password: senha
   );
  await userCredential.user!.updateDisplayName(nome);
  }
}