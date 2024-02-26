import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_cell.dart';
import 'package:tiktok_clone/Core/Profile/Component/no_posts_cell.dart';
import 'package:tiktok_clone/Repository/PostProvider/post_provider.dart';

class FeedView extends HookConsumerWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postStream = ref.watch(postNotifierProvider);

    return postStream.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (posts) {
          return posts.isNotEmpty
              ? PageView.builder(
                  itemCount: posts.length,
                  controller:
                      PageController(initialPage: 0, viewportFraction: 1),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return FeedCell(post: post);
                  },
                )
              : const NoPostsCell();
        });
  }
}
