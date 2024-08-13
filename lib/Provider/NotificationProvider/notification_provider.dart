import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_provider.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  @override
  Stream<List<Notification>> build() async* {
    try {
      final currentUserUid = auth.currentUser?.uid;
      if (currentUserUid == null) {
        logger.t("1");
        throw Exception('DEBUG: Not found user ID');
      }

      final notificationSnapshotStream =
          NotificationCollections.doc(currentUserUid)
              .collection('user-notifications')
              .snapshots();
      // ストリームをリッスンし、各スナップショットに対して処理を行う
      await for (final notificationSnapshot in notificationSnapshotStream) {
        final notifications =
            await Future.wait(notificationSnapshot.docs.map((doc) async {
          try {
            final notificationData = doc.data();
            var notification = Notification.fromJson(notificationData);

            // ユーザーデータ
            final userDoc =
                await UserCollections.doc(notification.notificationSenderUid)
                    .get();
            if (userDoc.exists) {
              notification =
                  notification.copyWith(user: User.fromJson(userDoc.data()!));
            }
            logger.t("notification 1 $notification");
            if (notification.postId != null) {
              logger.t("notification.postId!.isNotEmpty");
              // Postデータ
              final postDoc =
                  await PostCollections.doc(notification.postId).get();
              if (postDoc.exists) {
                notification =
                    notification.copyWith(post: Post.fromJson(postDoc.data()!));
              }
            }
            logger.t("notification 2 $notification");
            return notification;
          } catch (e) {
            logger.e("DEBUG: Failed to fetching notification with ${doc.id}",
                error: e);
            rethrow;
          }
        }).toList());

        yield notifications;
      }
    } catch (e) {
      logger.e("DEBUG: Failed to fetch all notification data", error: e);
      rethrow;
    }
  }
}
