import 'package:tiktok_clone/Utils/constants.dart';

class SplashViewModel {

  Future<bool> setupSubscribers() async {
    logger.d("Call: setupSubscribers");

    // widgetがmountするのを待つ
    await Future.delayed(Duration.zero);

    /// ログイン状態に応じて適切なページにリダイレクト
    final isCurrentUserSession = auth.currentUser;
    print("DEBUG: Current user $isCurrentUserSession");

    if (isCurrentUserSession != null) {
      return true;
    } else {
      return false;
    }
  }
}