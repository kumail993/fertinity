import 'package:faminity/ui/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

  Future<bool> login(String email, String password) async {
  try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // If signInWithEmailAndPassword succeeds, return true to indicate successful login
    return true;
  } on FirebaseAuthException catch (e) {
    // If signInWithEmailAndPassword fails, handle different error cases
    if (e.code == 'user-not-found') {
      showToast('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showToast('Wrong password provided for that user.');
    }
    // Return false to indicate login failure
    return false;
  }
}
}