import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Core/Comment/View/comment_view.dart';

void showChatSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // スクロール可能にする
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // 画面の90%の高さを使用
        child: CommentView(),
      );
    },
  );
}
