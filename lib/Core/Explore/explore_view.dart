import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Profile/View/profile_view.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Repository/UserProvider/user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class ExploreView extends HookConsumerWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 全てのユーザーを取得
    final allUsers = ref.watch(userNotifierProvider).when(
      data: (data) {
        logger.i("Successful: Fetch user data of ${data.length} cases");
        return data;
      },
      error: (e, stack) {
        print("エラー発生: $e");
        logger.e("DEBUG: Failed to fetch user data", error: e);
        return [];
      },
      loading: () {
        print("ローディング中...");
        logger.i("Loading: ExploreView userProviderProvider");
        return [];
      },
    );

    final searchController = useTextEditingController();
    final searchUsers = useState<List<User>>([]);

    useEffect(() {
      void listener() {
        final query = searchController.text;
        if (query.isNotEmpty) {
          searchUsers.value = allUsers
              .where((user) =>
                  user.username.toLowerCase().contains(query.toLowerCase()))
              .toList()
              .cast<User>();
          logger.i(
              "Successful: Number of users after filtering -> ${searchUsers.value.length}");
        } else {
          searchUsers.value = List<User>.from(allUsers);
          logger.i("Successful: Fetch all user");
        }
      }

      searchController.addListener(listener);
      return () {
        searchController.removeListener(listener);
      };
    }, [searchController, allUsers]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Explore',
              style: kAppBarTitleTextStyle,
            ),
            centerTitle: true,
            elevation: 0,
            automaticallyImplyLeading: false),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    filled: true,
                    labelText: 'Search..',
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : const SizedBox(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchUsers.value.length,
                    itemBuilder: (context, index) {
                      final user = searchUsers.value[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(user.profileImageUrl!),
                        ),
                        title: Text(user.username),
                        subtitle: Text(user.address),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProfileView(user: user)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
