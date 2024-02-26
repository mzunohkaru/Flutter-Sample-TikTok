import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Core/UploadPost/View/confirm_view.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class MediaSelectorView extends StatelessWidget {
  final Function resetAndNavigateToFeed;

  const MediaSelectorView({super.key, required this.resetAndNavigateToFeed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Upload Post", style: kAppBarTitleTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            showOptionsDialog(context: context);
          },
          icon: const Icon(
            Icons.upload_file,
            size: 140,
          ),
        ),
      ),
    );
  }

  // ギャラリーにアクセス
  Future<void> pickVideo(
      {required ImageSource src, required BuildContext context}) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmView(
            videoPath: video.path,
            resetAndNavigateToFeed: resetAndNavigateToFeed
          ),
        ),
      );
    }
  }

  showOptionsDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("投稿する動画を選択してみましょう"),
        titleTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          SimpleDialogOption(
            onPressed: () =>
                pickVideo(src: ImageSource.gallery, context: context),
            child: const Row(
              children: [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'ギャラリー',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () =>
                pickVideo(src: ImageSource.camera, context: context),
            child: const Row(
              children: [
                Icon(Icons.camera_alt),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'カメラ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: const Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'キャンセル',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
