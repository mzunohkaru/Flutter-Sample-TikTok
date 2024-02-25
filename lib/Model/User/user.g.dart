// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      username: json['username'] as String,
      address: json['address'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      followers: json['followers'] as int,
      following: json['following'] as int,
      likes: json['likes'] as int,
      post: (json['post'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'address': instance.address,
      'profileImageUrl': instance.profileImageUrl,
      'followers': instance.followers,
      'following': instance.following,
      'likes': instance.likes,
      'post': instance.post,
    };
