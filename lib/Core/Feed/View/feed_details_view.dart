import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_cell.dart';
import 'package:tiktok_clone/Model/Post/post.dart';

class FeedDetailsView extends HookWidget {
  final Post post;

  const FeedDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FeedCell(post: post),
          Positioned(
            top: 35,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
