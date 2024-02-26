import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_provider.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  final postCollection = FirebaseFirestore.instance.collection('posts');
  final userCollection = FirebaseFirestore.instance.collection('users');
  final currentUserUid = auth.currentUser?.uid;

  @override
  Stream<List<Post>> build() async* {
    yield* postCollection.snapshots().map((snapshot) async {
      try {
        final posts = await Future.wait(snapshot.docs.map((doc) async {
          final postData = doc.data() as Map<String, dynamic>;
          final ownerUid = postData['ownerUid'];
          final userDoc = await userCollection.doc(ownerUid).get();
          final userData = userDoc.data();
          // Post型に変換
          final post = Post.fromJson({...postData, 'user': userData});
          // likeUsers配列に現在のユーザーIDが含まれているかチェック
          final didLike =
              postData['likeUsers']?.contains(currentUserUid) ?? false;
          return post.copyWith(didLike: didLike);
        }));
        return posts.toList();
      } catch (e) {
        // エラーハンドリング
        print("エラーが発生しました: $e");
        return <Post>[];
      }
    }).asyncMap((event) async => await event);
  }
}
