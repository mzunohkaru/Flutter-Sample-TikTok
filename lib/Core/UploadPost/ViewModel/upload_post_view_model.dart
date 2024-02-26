import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/Repository/UserProvider/current_user_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class UploadPostViewModel {
  Future<void> uploadPost(
      {required WidgetRef ref,
      required String caption,
      required File videoFile,
      required File videoThumbnailFile}) async {
    logger.d("Call: UploadPostViewModel uploadPost");

    final currentUserUid = ref.watch(currentUserNotifierProvider);
    if (currentUserUid == null) {
      throw Exception('DEBUG: Not found user ID');
    }

    try {
      await uploadService.uploadVideo(
          currentUserUid: currentUserUid,
          caption: caption,
          videoFile: videoFile,
          videoThumbnailFile: videoThumbnailFile);
    } catch (e) {
      logger.e("DEBUG: Failed to uploading video");
      logger.e("DEBUG: Please make sure the video is 15 seconds or less",
          error: e);
    }
  }

  Future<File> createThumbnail({required File videoFile}) async {
    return await uploadService.createThumbnail(videoFile: videoFile);
  }
}
