import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class ProfileService {
  Future<String> _uploadImage(
      {required File file, required String currentUserUid}) async {
    logger.d("Call: ProfileService _uploadImage");

    // メタデータを設定
    SettableMetadata metadata = SettableMetadata(
      contentType: 'image/jpeg', // ここでファイルのタイプを指定します
    );

    /// Firebase Cloud Storageにアップロード
    final storageRef =
        storage.ref().child('profile').child(currentUserUid).putFile(file, metadata);

    final snapshot = await storageRef;
    return snapshot.ref.getDownloadURL();
  }

  Future<void> updateProfileData({
    required String currentUserUid,
    required String username,
    required String address,
    required File? profileImage,
  }) async {
    logger.d("Call: ProfileService updateProfileData");

    Map<String, dynamic> updateData = {
      'username': username,
      'address': address,
    };

    if (profileImage != null) {
      // userがプロフィール画像を保存しているか確認
      final snapshot = await UserCollections.doc(currentUserUid).get();
      final existingImageUrl = snapshot.data()?['profileImageUrl'];
      // userがプロフィール画像を保存している場合
      if (existingImageUrl != null) {
        try {
          // URLに基づいてStorage内のファイルへの参照
          final existingFileRef = storage.refFromURL(existingImageUrl);
          await existingFileRef.delete();
        } catch (e) {
          logger.e("DEBUG: Failed to delete profile image", error: e);
        }
      }
      // プロフィール画像をアップデート
      var imageUrl = await _uploadImage(
          file: profileImage, currentUserUid: currentUserUid);
      updateData['profileImageUrl'] = imageUrl;
    }

    final userDoc = UserCollections.doc(currentUserUid);

    await userDoc.update(updateData).catchError((e) {
      throw Exception("DEBUG: Failed to update data with profile $e");
    });
  }
}
