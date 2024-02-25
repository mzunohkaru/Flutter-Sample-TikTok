import 'package:tiktok_clone/Model/User/user.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class UserService {
  Future<User> fetchUser({required String uid}) async {
    logger.d("Call: UserService fetchUser");

    final userSnapshot = await UserCollections.doc(uid).get();
    return User.fromJson(userSnapshot.data()!);
  }

  Future like({required String currentUserUid, required String postId}) async {
    logger.d("Call: UserService like");

    await UserCollections.doc(currentUserUid)
        .collection('user-likes')
        .doc(postId)
        .set({});
  }

  Future unlike(
      {required String currentUserUid, required String postId}) async {
    logger.d("Call: UserService unlike");

    await UserCollections.doc(currentUserUid)
        .collection('user-likes')
        .doc(postId)
        .delete();
  }

  Future follow({required String currentUserUid, required String uid}) async {
    logger.d("Call: UserService follow");

    await FollowingCollections.doc(currentUserUid)
        .collection("user-following")
        .doc(uid)
        .set({});

    await FollowerCollections.doc(uid)
        .collection("user-followers")
        .doc(currentUserUid)
        .set({});

    final currentUser = await fetchUser(uid: currentUserUid);

    await UserCollections.doc(currentUserUid)
        .update({'following': currentUser.following + 1});

    final user = await fetchUser(uid: uid);

    await UserCollections.doc(uid).update({'followers': user.followers + 1});
  }

  Future unfollow({required String currentUserUid, required String uid}) async {
    logger.d("Call: UserService unfollow");

    await FollowingCollections.doc(currentUserUid)
        .collection("user-following")
        .doc(uid)
        .delete();

    await FollowerCollections.doc(uid)
        .collection("user-followers")
        .doc(currentUserUid)
        .delete();

    final currentUser = await fetchUser(uid: currentUserUid);

    await UserCollections.doc(currentUserUid)
        .update({'following': currentUser.following - 1});

    final user = await fetchUser(uid: uid);

    await UserCollections.doc(uid).update({'followers': user.followers - 1});
  }

  Future<bool> checkIfUserFollowed(
      {required String currentUserUid, required String uid}) async {
    logger.d("Call: UserService checkIfUserFollowed");

    final snapshot = await FollowingCollections.doc(currentUserUid)
        .collection("user-following")
        .doc(uid)
        .get();

    return snapshot.exists;
  }
}
