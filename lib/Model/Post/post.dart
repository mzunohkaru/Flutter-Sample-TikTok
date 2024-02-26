import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/timestamp.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String postId,
    required String ownerUid,
    required String caption,
    required int likeCount,
    required List likeUsers,
    required int commentCount,
    required bool didLike,
    required String videoUrl,
    required String thumbnail,
    @TimestampConverter() required Timestamp createAt,
    required User? user,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

