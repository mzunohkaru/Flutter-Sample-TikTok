import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_details_view.dart';
import 'package:tiktok_clone/Core/Profile/Component/no_posts_cell.dart';
import 'package:tiktok_clone/Core/Profile/Component/status_cell.dart';
import 'package:tiktok_clone/Core/Profile/View/edit_profile_view.dart';
import 'package:tiktok_clone/Core/Profile/ViewModel/profile_view_model.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/constants.dart';

import '../../../Usecase/Auth/BaseAuthenticatedUsecase/base_authenticated_usecase_impl.dart';

class ProfileView extends HookConsumerWidget {
  final User user;
  final viewModel = ProfileViewModel();

  ProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserUid =
        ref.watch(baseAuthenticatedUsecaseProvider).getCurrentUserId();
    final follow = useState<bool?>(null);

    useEffect(() {
      void checkFollowStatus() async {
        final isFollowing =
            await viewModel.checkIfUserFollowed(uid: user.userId);
        follow.value = isFollowing;
      }

      checkFollowStatus();
      return null;
    }, [user.userId]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: kAppBarTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: FutureBuilder(
          future: viewModel.fetchUser(userId: user.userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final user = snapshot.data;

                return Column(
                  children: [
                    CircularProfileImageView(
                      profileImageUrl: user!.profileImageUrl,
                      radius: 44,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(user.username, style: kUsernameTextStyle),
                    Text(
                      "@${user.address}",
                      style: kSubTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    StatusCell(
                      user: user,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (follow.value != null)
                      // Edit Button
                      currentUserUid == user.userId
                          ? SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => EditProfileView(
                                              initialUsername: user.username,
                                              initialAddress: user.address)),
                                    );
                                  },
                                  child: const Text("Edit Profile")),
                            )
                          // Follow Button
                          : SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: follow.value!
                                      ? Colors.white
                                      : Colors.black,
                                  foregroundColor: follow.value!
                                      ? Colors.black
                                      : Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () async {
                                  if (!follow.value!) {
                                    await viewModel.follow(
                                        ref: ref, uid: user.userId);
                                    follow.value = true;
                                  } else {
                                    await viewModel.unfollow(
                                        ref: ref, uid: user.userId);
                                    follow.value = false;
                                  }
                                },
                                child: follow.value!
                                    ? const Text("Following")
                                    : const Text("Follow"),
                              ),
                            ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(),
                    user.post!.isNotEmpty
                        ? Flexible(
                            child: GridView.builder(
                              itemCount: user.post!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.0,
                                mainAxisSpacing: 1.0,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                final userPost = user.post![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FeedDetailsView(
                                                    post: userPost)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            userPost.thumbnail,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const NoPostsCell()
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

enum ProfileStats { followers, following, likes }

String getStatTitle(ProfileStats stat) {
  switch (stat) {
    case ProfileStats.followers:
      return "Followers";
    case ProfileStats.following:
      return "Following";
    case ProfileStats.likes:
      return "Likes";
    default:
      return "";
  }
}

int getStatValue(ProfileStats stat, dynamic user) {
  switch (stat) {
    case ProfileStats.followers:
      return user.followers;
    case ProfileStats.following:
      return user.following;
    case ProfileStats.likes:
      return user.likes;
    default:
      return 0;
  }
}
