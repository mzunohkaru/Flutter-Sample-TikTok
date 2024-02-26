import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Repository/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class FeedViewModel {
  Future<void> like({required WidgetRef ref, required String postId}) async {
    logger.d("Call: FeedViewModel like");

    final currentUserUid = ref.watch(currentUserNotifierProvider);
    if (currentUserUid == null) {
      throw Exception('DEBUG: Not found user ID');
    }

    try {
      final post = await postService.fetchPost(postId: postId);

      await postService.like(
          postId: postId,
          currentUserUid: currentUserUid,
          postLikeCount: post.likeCount);

      await userService.like(currentUserUid: currentUserUid, postId: postId);
    } catch (e) {
      logger.e("DEBUG: Failed to saving liked with post", error: e);
    }
  }

  Future<void> unlike({required WidgetRef ref, required String postId}) async {
    logger.d("Call: FeedViewModel unlike");

    final currentUserUid = ref.watch(currentUserNotifierProvider);
    if (currentUserUid == null) {
      throw Exception('DEBUG: Not found user ID');
    }

    try {
      final post = await postService.fetchPost(postId: postId);

      await postService.unlike(postId: postId, currentUserUid: currentUserUid, postLikeCount: post.likeCount);

      await userService.unlike(currentUserUid: currentUserUid, postId: postId);
    } catch (e) {
      logger.e("DEBUG: Failed to saving unlike with post", error: e);
    }
  }
}
