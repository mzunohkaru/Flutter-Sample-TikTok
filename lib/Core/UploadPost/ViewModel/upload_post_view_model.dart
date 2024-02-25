import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class UploadPostViewModel {
  Future<void> uploadPost(
      {required WidgetRef ref,
      required XFile imageFile,
      required String caption}) async {
    logger.d("Call: UploadPostViewModel uploadPost");

    try {} catch (e) {
      logger.e("DEBUG: Failed to upload post", error: e);
    }
  }

  // サムネイルを自動生成
  Future<File> createThumbnail({required String videoPath}) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }
}
