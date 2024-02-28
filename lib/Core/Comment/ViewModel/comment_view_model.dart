import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Repository/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class CommentViewModel {
  Future<void> comment(
      {required WidgetRef ref,
      required Post post,
      required String commentText}) async {
    logger.d("Call: CommentViewModel comment");

    try {
      final currentUserUid = ref.watch(currentUserNotifierProvider);
      if (currentUserUid == null) {
        throw Exception('DEBUG: Not found user ID');
      }

      await postService.comment(
          postId: post.postId,
          commentText: commentText,
          currentUserUid: currentUserUid);

      await notificationService.uploadNotification(
          currentUserUid: currentUserUid,
          toUid: post.ownerUid,
          type: NotificationType.comment,
          post: post);
    } catch (e) {
      logger.e("DEBUG: Failed to saving comment", error: e);
      throw Exception('DEBUG: Failed post comment');
    }
  }
}
