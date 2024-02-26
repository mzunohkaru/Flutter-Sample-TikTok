import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'package:video_compress/video_compress.dart';

class UploadService {
  Future uploadVideo(
      {required String currentUserUid,
      required String caption,
      required File videoFile,
      required File videoThumbnailFile}) async {

    var allDocs = await PostCollections.get();
    final len = allDocs.docs.length;

    // ビデオをストレージに保存
    final videoUrl =
        await _uploadVideoToStorage(id: "Video $len", videoFile: videoFile);

    // サムネイルをストレージに保存
    final thumbnail = await _uploadImageToStorage(
        id: "Video $len", videoThumbnailFile: videoThumbnailFile);

    await PostCollections.doc('Video $len').set({
      'postId': "Video $len",
      'ownerUid': currentUserUid,
      'caption': caption,
      'likeCount': 0,
      'likeUsers': [],
      'commentCount': 0,
      'didLike': false,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'createAt': Timestamp.now(),
    });
  }

  Future<String> _uploadVideoToStorage(
      {required String id, required File videoFile}) async {
    final ref = storage.ref().child('videos').child(id);
    final uploadTask = ref.putFile(await _compressVideo(videoFile: videoFile));
    final snap = await uploadTask;
    return await snap.ref.getDownloadURL();
  }

  // ビデオを圧縮する
  Future _compressVideo({required File videoFile}) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoFile.path,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadImageToStorage(
      {required String id, required File videoThumbnailFile}) async {
    final ref = storage.ref().child('thumbnails').child(id);
    final uploadTask = ref.putFile(videoThumbnailFile);
    final snap = await uploadTask;
    return await snap.ref.getDownloadURL();
  }

  // サムネイルを自動生成
  Future<File> createThumbnail({required File videoFile}) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoFile.path);
    return thumbnail;
  }
}
