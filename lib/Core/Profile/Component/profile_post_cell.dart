import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tiktok_clone/Core/Profile/Component/no_posts_cell.dart';
import 'package:tiktok_clone/Model/User/user.dart';

class ProfilePostCell extends HookWidget {
  final User user;

  const ProfilePostCell({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.post!.isNotEmpty
        ? GridView.builder(
            itemCount: user.post!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final userPost = user.post![index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    image: DecorationImage(
                        image: NetworkImage(
                          userPost.thumbnail,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          )
        : const NoPostsCell();
  }
}
