import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_icon.dart';
import 'package:tiktok_clone/Core/Feed/ViewModel/feed_view_model.dart';
import 'package:tiktok_clone/Core/Profile/View/profile_view.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Widgets/sheet_widget.dart';
import 'package:tiktok_clone/Widgets/video_player_item_widget.dart';

class FeedCell extends HookConsumerWidget {
  final Post post;
  final viewModel = FeedViewModel();

  FeedCell({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final didLike = useState(post.didLike);

    return Stack(
      children: [
        VideoPlayerItem(
          videoUrl: post.videoUrl,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            post.user?.username ?? "username",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            post.caption,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.music_note,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text(
                                "song name",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(top: size.height / 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileView(user: post.user!)),
                            );
                          },
                          child: CircularProfileImageView(
                              profileImageUrl: post.user?.profileImageUrl,
                              radius: 22),
                        ),
                        FeedIcon(
                          voidCallBack: () async {
                            if (didLike.value) {
                              await viewModel.unlike(
                                  ref: ref, postId: post.postId);
                            } else {
                              await viewModel.like(
                                  ref: ref, postId: post.postId);
                            }
                            didLike.value = !didLike.value;
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 35,
                            color: didLike.value ? Colors.red : Colors.white,
                          ),
                          countText: post.likeCount.toString(),
                        ),
                        FeedIcon(
                          voidCallBack: () =>
                              showChatSheet(context: context, post: post),
                          icon: const Icon(
                            Icons.comment,
                            size: 35,
                            color: Colors.white,
                          ),
                          countText: post.commentCount.toString(),
                        ),
                        FeedIcon(
                          voidCallBack: () => print("DEBUG: share"),
                          icon: const Icon(
                            Icons.reply,
                            size: 35,
                            color: Colors.white,
                          ),
                          countText: "",
                        ),
                        post.user?.profileImageUrl != null
                            ? buildMusicAlbum(
                                profileImageUrl: post.user!.profileImageUrl!)
                            : const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.green,
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildMusicAlbum({required String profileImageUrl}) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profileImageUrl),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }
}
