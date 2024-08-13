import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/Utils/constants.dart';
part 'current_user_provider.g.dart';

@riverpod
class CurrentUserNotifier extends _$CurrentUserNotifier {
  // 現在のユーザーIDを提供するプロバイダ
  @override
  String? build() {
    logger.d("Call: CurrentUserProvider");

    return auth.currentUser?.uid;
  }

  void fetchUser() {
    state = auth.currentUser?.uid;
  }

  void logOutUser() {
    state = null;
  }
}