import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class NotificationService {
  Future uploadNotification(
      {required String currentUserUid,
      required String toUid,
      required NotificationType type,
      required Post? post}) async {
    final ref = NotificationCollections.doc(toUid)
        .collection("user-notifications")
        .doc();

    await ref.set({
      'id': ref.id,
      'notificationSenderUid': currentUserUid,
      'type': type.index,
      'createAt': Timestamp.now(),
      if (post != null) 'postId': post.postId,
    });
  }
}
