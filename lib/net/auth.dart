import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
=======
import 'package:jamal_v1/net/database.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> register(String email, String password, String name, String age,
      String height, String weight, String fitnessLevel) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      User user = result.user;

      // create default values for now
      await DatabaseService(uid: user.uid).updateUserData(
          email, password, name, age, height, weight, fitnessLevel);

>>>>>>> 2991f5ffdb559bd09b79ab3fc1d552c3a4e7428d
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
<<<<<<< HEAD
      await auth.signInWithEmailAndPassword(
        email: email,
=======
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
>>>>>>> 2991f5ffdb559bd09b79ab3fc1d552c3a4e7428d
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
<<<<<<< HEAD
      await auth.signInAnonymously();
=======
      await _auth.signInAnonymously();
>>>>>>> 2991f5ffdb559bd09b79ab3fc1d552c3a4e7428d
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
<<<<<<< HEAD
=======

  // get user UID
  Future<String> getCurrentID() async {
    return (await _auth.currentUser).uid;
  }

  // get user UID
  User getCurrentUser() {
    //return firebase.auth().currentUser;
    return _auth.currentUser;
  }
>>>>>>> 2991f5ffdb559bd09b79ab3fc1d552c3a4e7428d
}
