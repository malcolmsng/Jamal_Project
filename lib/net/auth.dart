import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
    return false;
  }

  Future<bool> anon() async {
    try {
      await auth.signInAnonymously();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
