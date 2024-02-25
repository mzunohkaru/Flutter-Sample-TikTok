// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String,
      ownerUid: json['ownerUid'] as String,
      caption: json['caption'] as String,
      postImageUrl: json['postImageUrl'] as String,
      likes: json['likes'] as int,
      likeUsers: json['likeUsers'] as List<dynamic>,
      didLike: json['didLike'] as bool,
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
      'postImageUrl': instance.postImageUrl,
      'likes': instance.likes,
      'likeUsers': instance.likeUsers,
      'didLike': instance.didLike,
      'createAt': const TimestampConverter().toJson(instance.createAt),
      'user': instance.user,
    };
