import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class CommentViewModel {
  Future<void> comment(
      {required WidgetRef ref,
      required String postId,
      required String commentText}) async {
    logger.d("Call: CommentViewModel comment");

    // try {
    //   final currentUserUid = ref.watch(currentUserProviderProvider);
    //   if (currentUserUid == null) {
    //     throw Exception('DEBUG: Not found user ID');
    //   }

    //   postService.comment(
    //       postId: postId,
    //       commentText: commentText,
    //       currentUserUid: currentUserUid);
    // } catch (e) {
    //   logger.e("DEBUG: Failed to saving comment", error: e);
    //   throw Exception('DEBUG: Failed post comment');
    // }
  }
}
