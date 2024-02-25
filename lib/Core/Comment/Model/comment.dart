import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/Utils/timestamp.dart';
import 'package:tiktok_clone/Model/User/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment(
      {required String commentId,
      required String postOwnerUid,
      required String commentText,
      required String postId,
      required String commentOwnerUid,
      @TimestampConverter() required Timestamp createAt,
      required User? user,
      }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
