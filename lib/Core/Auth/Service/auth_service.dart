import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:tiktok_clone/Core/Auth/Service/auth_error.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  factory AuthService() {
    return instance;
  }

  Future<String?> login(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String?> signUp({
    required String email,
    required String username,
    required String address,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await _saveUserToFirestore(userId: userCredential.user!.uid, username: username, address: address, email: email);
  }

  Future _saveUserToFirestore(
      {required String userId,
      required String username,
      required String address,
      required String email}) async {
    try {
      await UserCollections.doc(userId).set({
        'userId': userId,
        'username': username,
        'address': address,
        'email': email,
        'followers': 0,
        'following': 0,
        'likes': 0,
      });
    } on FirebaseAuthException catch (e) {
      print(getFirestoreErrorMessage(e.code));
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      logger.i("Successful: Sign out");
    } on FirebaseAuthException catch (e) {
      logger.e("DEBUG: Failed to sign out", error: e);
    }
  }

  // Google認証
  Future googleSingIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // 認証情報を取得
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // 認証情報をFirebaseに登録
      User? user = (await auth.signInWithCredential(credential)).user;
      if (user != null) {
        logger.i("Successful: Google Auth");
      }
    }
  }

  // Apple IDでのログイン
  Future<void> signInWithApple() async {
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    final authResult = await auth.signInWithCredential(oauthCredential);
    final user = authResult.user;

    if (user != null) {
      logger.i("Successful: Apple ID Auth");
    }
  }
}
