import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return user;
  }

  Future<UserCredential> registerNewUser({
    required String email,
    required String password,
  }) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }
}
