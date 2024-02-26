import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiktok_clone/Core/Comment/Model/comment.dart';
import 'package:tiktok_clone/Utils/constants.dart';
part 'post_comment_provider.g.dart';

@riverpod
class PostCommentNotifier extends _$PostCommentNotifier {
  // 投稿のコメントを取得・監視
  @override
  Stream<List<Comment>> build(postId) async* {
    logger.d("Call: PostCommentProvider");

    try {
      final commentsSnapshotStream =
          PostCollections.doc(postId).collection('post-comments').orderBy('createAt', descending: true).snapshots();

      // ストリームをリッスンし、各スナップショットに対して処理を行う
      await for (final commentsSnapshot in commentsSnapshotStream) {
        final comments =
            await Future.wait(commentsSnapshot.docs.map((doc) async {
          try {
            final commentData = doc.data();
            final userDoc =
                await UserCollections.doc(commentData['commentOwnerUid']).get();
            final userData = userDoc.data();
            if (userData == null) {
              return null;
            }
            // Comment型に変換
            final comment =
                Comment.fromJson({...commentData, 'user': userData});
            return comment;
          } catch (e) {
            logger.e('DEBUG: Failed to fetching comment data with ${doc.id}', error: e);
            rethrow;
          }
        }).toList());

        yield comments
            .where((comment) => comment != null)
            .cast<Comment>()
            .toList();
      }
    } catch (e) {
      logger.e('DEBUG: Failed to fetch all comment data', error: e);
      rethrow;
    }
  }
}
