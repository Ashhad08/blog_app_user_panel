import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<UserCredential> signUpUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
