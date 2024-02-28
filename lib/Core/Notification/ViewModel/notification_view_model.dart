import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class NotificationViewModel {

  Future<void> uploadNotification({
    required String currentUserUid,
    required String toUid,
    required NotificationType type,
    Post? post,
  }) async {
    try {
      await notificationService.uploadNotification(
        currentUserUid: currentUserUid,
        toUid: toUid,
        type: type,
        post: post,
      );
    } catch (e) {
      logger.e("DEBUG: Failed to uploading notification", error: e);
      throw Exception("DEBUG: Failed to uploading notification");
    }
  }
}
