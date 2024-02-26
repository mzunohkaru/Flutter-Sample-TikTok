import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_clone/Core/Auth/Service/auth_error.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class RegistrationViewModel {
  Future<String?> signUp(
      {required String email,
      required String username,
      required String address,
      required String password
      }) async {
    try {
      // シングルトンインスタンスからlogin関数を呼ぶ
      await authService.signUp(
        email: email,
        username: username,
        address: address,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return getSignUpErrorMessage(e.code);
    }
    return null;
  }
}
