import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Profile/View/edit_profile_view.dart';
import 'package:tiktok_clone/Core/Profile/View/settings_view.dart';
import 'package:tiktok_clone/Core/Profile/View/status_cell.dart';
import 'package:tiktok_clone/Core/Profile/ViewModel/profile_view_model.dart';
import 'package:tiktok_clone/Repository/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class CurrentProfileView extends ConsumerWidget {
  final viewModel = ProfileViewModel();
  CurrentProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserUid = ref.watch(currentUserNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profile", style: kAppBarTitleTextStyle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsView(viewModel: viewModel),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FutureBuilder(
            future: viewModel.fetchUser(userId: currentUserUid!),
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
                      SizedBox(
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
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              userPost.postImageUrl,
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.post_add,
                                    size: 80,
                                  ),
                                  Text(
                                    "No Posts",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "New posts you receive will appear here.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
