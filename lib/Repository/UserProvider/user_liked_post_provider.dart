import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/constants.dart';
part 'user_liked_post_provider.g.dart';

@riverpod
class UserLikedPostNotifier extends _$UserLikedPostNotifier {
  // 「いいね」した投稿のみを取得・監視
  @override
  Stream<List<Post>> build() async* {
    logger.d("Call: UserLikedPostNotifier");

    try {
      final currentUserUid = auth.currentUser?.uid;
      if (currentUserUid == null) {
        throw Exception('DEBUG: Not found user ID');
      }

      // usersコレクションから現在のユーザーIDに一致するドキュメントのuser-likesサブコレクションを取得
      final userLikesSnapshotStream = UserCollections.doc(currentUserUid)
          .collection('user-likes')
          .snapshots();

      // ストリームをリッスンし、各スナップショットに対して処理を行う
      await for (final userLikesSnapshot in userLikesSnapshotStream) {
        final posts = await Future.wait(userLikesSnapshot.docs.map((doc) async {
          try {
            // user-likesサブコレクションのドキュメントID（投稿ID）を使用して、postsコレクションから一致するデータを取得
            final postDoc = await PostCollections.doc(doc.id).get();
            final postData = postDoc.data();
            if (postData == null) {
              return null;
            }
            // Post型に変換
            var post = Post.fromJson(postData);
            // ownerUidフィールドの値を取得して、User型のデータを取得
            final userDoc = await UserCollections.doc(post.ownerUid).get();
            final userData = userDoc.data();
            if (userData != null) {
              // User型のデータをpostのuserに格納
              post = post.copyWith(user: User.fromJson(userData));
            }
            // postデータのdidLikeをTrueに設定
            post = post.copyWith(didLike: true);
            return post;
          } catch (e) {
            logger.e("DEBUG: Failed to fetching post with ${doc.id}", error: e);
            rethrow;
          }
        }).toList());

        // nullを除外し、Post型にキャストした後、リストとしてストリームに渡す
        yield posts.where((post) => post != null).cast<Post>().toList();
      }
    } catch (e) {
      logger.e("DEBUG: Failed to fetch all data", error: e);
      rethrow;
    }
  }
}