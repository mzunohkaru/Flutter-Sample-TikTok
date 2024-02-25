// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      commentId: json['commentId'] as String,
      postOwnerUid: json['postOwnerUid'] as String,
      commentText: json['commentText'] as String,
      postId: json['postId'] as String,
      commentOwnerUid: json['commentOwnerUid'] as String,
      createAt: const TimestampConverter().fromJson(json['createAt']),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'postOwnerUid': instance.postOwnerUid,
      'commentText': instance.commentText,
      'postId': instance.postId,
      'commentOwnerUid': instance.commentOwnerUid,
      'createAt': const TimestampConverter().toJson(instance.createAt),
      'user': instance.user,
    };
