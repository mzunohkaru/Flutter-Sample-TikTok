import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/timestamp.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String? postId,
    required String notificationSenderUid,
    required int type,
    @TimestampConverter() required Timestamp createAt,
    required Post? post,
    required User? user,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

enum NotificationType {
  like,
  comment,
  follow,
}

String notificationMessage(int typeIndex) {
  switch (typeIndex) {
    case 0:
      return "liked one of your posts.";
    case 1:
      return "commented on one of your posts.";
    case 2:
      return "started following you.";
    default:
      return "notification.";
  }
}
