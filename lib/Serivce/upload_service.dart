import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
    // メタデータを設定
    final metadata = SettableMetadata(
      contentType: "video/quicktime",
    );
    // 圧縮されたビデオファイルを取得
    final compressedVideoFile = await _compressVideo(videoFile: videoFile);
    final uploadTask = ref.putFile(compressedVideoFile, metadata);
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
    // サムネイルを圧縮
    final compressedImage = await _compressImage(imageFile: videoThumbnailFile);
    final ref = storage.ref().child('thumbnails').child(id);
    final uploadTask = ref.putFile(compressedImage);
    final snap = await uploadTask;
    return await snap.ref.getDownloadURL();
  }

  // 画像を圧縮するメソッドを追加
  Future<File> _compressImage({required File imageFile}) async {
    try {
      final filePath = imageFile.absolute.path;
      // 正規表現RegExp(r'.jp')にマッチする最後のインデックスを検索
      // この正規表現は、.jpという文字列を探していますが、正確には.jpegや.jpgのファイル拡張子を意図している
      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      // ファイルの拡張子を除いたパスを取得
      final splitted = filePath.substring(0, (lastIndex));
      // 圧縮後の画像ファイルのパスを生成
      final outPath = "${splitted}_compressed.jpg";
      // filePathの画像を圧縮
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        quality: 50,
      );
      return File(compressedImage!.path);
    } catch (e) {
      logger.e("DEBUG: Failed to compressed image", error: e);
      return imageFile;
    }
  }

  // サムネイルを自動生成
  Future<File> createThumbnail({required File videoFile}) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoFile.path);
    return thumbnail;
  }
}
