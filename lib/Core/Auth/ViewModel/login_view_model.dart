import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_clone/Core/Auth/Service/auth_error.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class LoginViewModel {
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await authService.login(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return getLoginErrorMessage(e.code);
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      await authService.googleSingIn();
    } on FirebaseAuthException catch (e) {
      return getGoogleSignInLoginErrorMessage(e.code);
    }
  }

  Future<String?> signInWithApple() async {
    try {
      await authService.signInWithApple();
    } on FirebaseAuthException catch (e) {
      return getAppleSignInErrorMessage(e.code);
    }
  }
}
