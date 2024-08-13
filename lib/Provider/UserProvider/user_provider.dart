import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/constants.dart';
part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<List<User>> build() async {
    logger.d("Call: UserProvider");

    try {
      final currentUserUid = auth.currentUser?.uid;
      if (currentUserUid == null) {
        throw Exception('DEBUG: Not found user ID');
      }

      // usersコレクションの全データを取得
      final usersSnapshot = await UserCollections.get();
      // 取得したデータをUser型に変換し、現在のユーザーを除外
      final users = usersSnapshot.docs
          .map((doc) {
            return User.fromJson(doc.data());
          })
          .where((user) => user.userId != currentUserUid)
          .toList();
      return users;
    } catch (e) {
      logger.e("DEBUG: Failed to fetching user data", error: e);
      rethrow;
    }
  }
}
