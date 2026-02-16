import 'package:book_store/src/features/authentication/presentation/providers/handle_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return user;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<UserCredential> registerNewUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw handleException(e);
    }
  }
}
