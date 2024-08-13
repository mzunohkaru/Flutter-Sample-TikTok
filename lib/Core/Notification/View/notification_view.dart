import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_details_view.dart';
import 'package:tiktok_clone/Core/Notification/ViewModel/notification_view_model.dart';
import 'package:tiktok_clone/Core/Profile/View/profile_view.dart';
import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Provider/NotificationProvider/notification_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'package:tiktok_clone/Utils/format_date.dart';

class NotificationView extends ConsumerWidget {
  final viewModel = NotificationViewModel();
  NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationStream = ref.watch(notificationNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
            'Notifications',
            style: kAppBarTitleTextStyle,
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false),
      body: notificationStream.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
        data: (notifications) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = notifications[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  CircularProfileImageView(
                      profileImageUrl: notification.user?.profileImageUrl,
                      radius: 18),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: notification.user!.username,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    " ${notificationMessage(notification.type)} ",
                                style: const TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: formatDate(notification.createAt),
                                style: kSubTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  notification.postId != null
                      ? Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FeedDetailsView(
                                      post: notification.post!)));
                            },
                            child: Image.network(
                              notification.post!.thumbnail,
                              scale: 9,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ProfileView(user: notification.user!)));
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                          ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
