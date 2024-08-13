import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Utils/constants.dart';

import '../../../Usecase/Auth/BaseAuthenticatedUsecase/base_authenticated_usecase_impl.dart';

class FeedViewModel {
  Future<void> like({required WidgetRef ref, required String postId}) async {
    logger.d("Call: FeedViewModel like");

    final currentUserUid = ref.watch(baseAuthenticatedUsecaseProvider).getCurrentUserId();

    try {
      final post = await postService.fetchPost(postId: postId);

      await postService.like(
          postId: postId,
          currentUserUid: currentUserUid,
          postLikeCount: post.likeCount);

      await userService.like(currentUserUid: currentUserUid, postId: postId);

      await notificationService.uploadNotification(
          currentUserUid: currentUserUid,
          toUid: post.ownerUid,
          type: NotificationType.like,
          post: post);
    } catch (e) {
      logger.e("DEBUG: Failed to saving liked with post", error: e);
    }
  }

  Future<void> unlike({required WidgetRef ref, required String postId}) async {
    logger.d("Call: FeedViewModel unlike");

   final currentUserUid = ref.watch(baseAuthenticatedUsecaseProvider).getCurrentUserId();

    try {
      final post = await postService.fetchPost(postId: postId);

      await postService.unlike(
          postId: postId,
          currentUserUid: currentUserUid,
          postLikeCount: post.likeCount);

      await userService.unlike(currentUserUid: currentUserUid, postId: postId);
    } catch (e) {
      logger.e("DEBUG: Failed to saving unlike with post", error: e);
    }
  }
}
