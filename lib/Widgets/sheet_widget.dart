import 'package:flutter/material.dart';
import 'package:tiktok_clone/Core/Comment/View/comment_view.dart';
import 'package:tiktok_clone/Model/Post/post.dart';

void showChatSheet({
  required BuildContext context,
  required Post post,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // スクロール可能にする
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.7, // 画面の90%の高さを使用
        child: CommentView(post: post),
      );
    },
  );
}
