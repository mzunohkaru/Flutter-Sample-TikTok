// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String,
      ownerUid: json['ownerUid'] as String,
      caption: json['caption'] as String,
      likeCount: json['likeCount'] as int,
      likeUsers: json['likeUsers'] as List<dynamic>,
      commentCount: json['commentCount'] as int,
      didLike: json['didLike'] as bool,
      videoUrl: json['videoUrl'] as String,
      thumbnail: json['thumbnail'] as String,
      createAt: const TimestampConverter().fromJson(json['createAt']),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'ownerUid': instance.ownerUid,
      'caption': instance.caption,
      'likeCount': instance.likeCount,
      'likeUsers': instance.likeUsers,
      'commentCount': instance.commentCount,
      'didLike': instance.didLike,
      'videoUrl': instance.videoUrl,
      'thumbnail': instance.thumbnail,
      'createAt': const TimestampConverter().toJson(instance.createAt),
      'user': instance.user,
    };
