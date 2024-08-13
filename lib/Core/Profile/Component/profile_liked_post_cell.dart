import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_details_view.dart';
import 'package:tiktok_clone/Core/Profile/Component/no_posts_cell.dart';
import 'package:tiktok_clone/Provider/UserProvider/user_liked_post_provider.dart';

class ProfileLikedPostCell extends HookConsumerWidget {
  const ProfileLikedPostCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedPostStream = ref.watch(userLikedPostNotifierProvider);

    return likedPostStream.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (posts) {
          return posts.isNotEmpty
              ? GridView.builder(
                  itemCount: posts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FeedDetailsView(post: post)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          image: DecorationImage(
                              image: NetworkImage(
                                post.thumbnail,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                )
              : const NoPostsCell();
        });
  }
}
