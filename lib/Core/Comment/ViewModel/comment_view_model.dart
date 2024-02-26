import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Repository/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class CommentViewModel {
  Future<void> comment(
      {required WidgetRef ref,
      required String postId,
      required String commentText}) async {
    logger.d("Call: CommentViewModel comment");

    try {
      final currentUserUid = ref.watch(currentUserNotifierProvider);
      if (currentUserUid == null) {
        throw Exception('DEBUG: Not found user ID');
      }

      postService.comment(
          postId: postId,
          commentText: commentText,
          currentUserUid: currentUserUid);
    } catch (e) {
      logger.e("DEBUG: Failed to saving comment", error: e);
      throw Exception('DEBUG: Failed post comment');
    }
  }
}
