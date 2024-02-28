// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      postId: json['postId'] as String?,
      notificationSenderUid: json['notificationSenderUid'] as String,
      type: json['type'] as int,
      createAt: const TimestampConverter().fromJson(json['createAt']),
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'notificationSenderUid': instance.notificationSenderUid,
      'type': instance.type,
      'createAt': const TimestampConverter().toJson(instance.createAt),
      'post': instance.post,
      'user': instance.user,
    };
