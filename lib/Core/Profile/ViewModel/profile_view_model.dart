import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Core/Profile/Service/profile_service.dart';
import 'package:tiktok_clone/Model/Notification/notification.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Provider/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class ProfileViewModel {
  Future<User?> fetchUser({required String userId}) async {
    logger.d("Call: ProfileViewModel fetchUser");

    try {
      // 引数のユーザーの投稿データを取得
      final postsQuerySnapshot =
          await PostCollections.where('ownerUid', isEqualTo: userId).get();

      // Post型に変換
      final posts = postsQuerySnapshot.docs
          .map((doc) => Post.fromJson(doc.data()))
          .toList();

      // 引数のユーザーのユーザーデータを取得
      final userDoc = await UserCollections.doc(userId).get();
      if (!userDoc.exists) {
        throw Exception('User not found');
      }

      final userData = userDoc.data()!;
      return User.fromJson({
        'userId': userData['userId'],
        'username': userData['username'],
        'address': userData['address'],
        'profileImageUrl': userData['profileImageUrl'],
        'followers': userData['followers'],
        'following': userData['following'],
        'likes': userData['likes'],
        'post': posts.map((post) => post.toJson()).toList(),
      });
    } catch (e) {
      logger.e("DEBUG: Failed to fetching username", error: e);
      return null;
    }
  }

  Future<void> updateProfile({
    required WidgetRef ref,
    required String username,
    required String address,
    required File? profileImage,
  }) async {
    logger.d("Call: ProfileViewModel updateProfile");

    try {
      final currentUserUid = ref.watch(currentUserNotifierProvider);
      if (currentUserUid == null) {
        throw Exception('DEBUG: Not found user ID');
      }

      await ProfileService().updateProfileData(
        currentUserUid: currentUserUid,
        username: username,
        address: address,
        profileImage: profileImage,
      );
    } catch (e) {
      logger.e("DEBUG: Failed to update data with profile", error: e);
    }
  }

  Future signOut({required WidgetRef ref}) async {
    logger.d("Call: ProfileViewModel signOut");

    await authService.signOut();
    ref.read(currentUserNotifierProvider.notifier).logOutUser();
  }

  Future follow({required WidgetRef ref, required String uid}) async {
    logger.d("Call: ProfileViewModel follow");

    final currentUserUid = ref.watch(currentUserNotifierProvider);
    if (currentUserUid == null) {
      throw Exception('DEBUG: Not found user ID');
    }

    try {
      await userService.follow(currentUserUid: currentUserUid, uid: uid);

      await notificationService.uploadNotification(
          currentUserUid: currentUserUid,
          toUid: uid,
          type: NotificationType.follow,
          post: null);
    } catch (e) {
      logger.e("DEBUG: Failed to follow process or notification upload",
          error: e);
      throw Exception('Failed to follow process or notification upload');
    }
  }

  Future unfollow({required WidgetRef ref, required String uid}) async {
    logger.d("Call: ProfileViewModel unfollow");

    final currentUserUid = ref.watch(currentUserNotifierProvider);
    if (currentUserUid == null) {
      throw Exception('DEBUG: Not found user ID');
    }
    try {
      await userService.unfollow(currentUserUid: currentUserUid, uid: uid);
    } catch (e) {
      logger.e("DEBUG: Failed to unfollow process or notification upload",
          error: e);
      throw Exception('Failed to unfollow process or notification upload');
    }
  }

  Future<bool> checkIfUserFollowed({required String uid}) async {
    logger.d("Call: ProfileViewModel checkIfUserFollowed");

    final currentUserUid = auth.currentUser!.uid;

    return await userService.checkIfUserFollowed(
        currentUserUid: currentUserUid, uid: uid);
  }
}
