import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {


  FirebaseAuth auth = FirebaseAuth.instance;

  login(email, password) async {
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw 'Usuário não encontrado. Verifique o email.';
        case 'wrong-password':
          throw 'Senha incorreta. Tente novamente.';
        case 'invalid-email':
          throw 'O formato do email é inválido.';
        case 'user-disabled':
          throw 'Esta conta foi desativada.';
        case 'too-many-requests':
          throw 'Muitas tentativas de login. Tente novamente mais tarde.';
        default:
          throw 'Erro de autenticação: ${e.message}';
      }
    }
  }

  register(name, phone, email, password) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await user.user!.updateDisplayName(name);

      print(user.user!.displayName);
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    }
  }



  checkUser() async {

    var user = await auth.currentUser;
    return user!.displayName;

  }


}







