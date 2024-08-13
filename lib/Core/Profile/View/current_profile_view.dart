import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Profile/Component/profile_liked_post_cell.dart';
import 'package:tiktok_clone/Core/Profile/Component/profile_post_cell.dart';
import 'package:tiktok_clone/Core/Profile/Component/status_cell.dart';
import 'package:tiktok_clone/Core/Profile/View/edit_profile_view.dart';
import 'package:tiktok_clone/Core/Profile/View/settings_view.dart';
import 'package:tiktok_clone/Core/Profile/ViewModel/profile_view_model.dart';
import 'package:tiktok_clone/Provider/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class CurrentProfileView extends ConsumerWidget {
  final viewModel = ProfileViewModel();
  CurrentProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserUid = ref.watch(currentUserNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      Flexible(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: <Widget>[
                              const TabBar(
                                tabs: [
                                  Tab(text: "Posts"),
                                  Tab(text: "Likes"),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    // 1ページ目
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: ProfilePostCell(user: user),
                                    ),

                                    // 2ページ目
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: ProfileLikedPostCell(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
