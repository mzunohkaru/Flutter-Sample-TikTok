import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/UploadPost/View/upload_post_view.dart';
import 'package:tiktok_clone/Core/UploadPost/ViewModel/upload_post_view_model.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'package:tiktok_clone/Widgets/video_player_item_widget.dart';

class ConfirmView extends HookConsumerWidget {
  final String videoPath;
  final viewModel = UploadPostViewModel();

  ConfirmView(
      {super.key,
      required this.videoPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Upload Post", style: kAppBarTitleTextStyle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 16,
                  child: VideoPlayerItem(
                    videoUrl: videoPath,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: !isLoading.value
                        ? () async {
                            isLoading.value = true;

                            File videoThumbnailFile = await viewModel
                                .createThumbnail(videoFile: File(videoPath));

                            isLoading.value = false;

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => UploadPostView(
                                    videoFile: File(videoPath),
                                    videoThumbnailFile: videoThumbnailFile),
                              ),
                            );
                          }
                        : null,
                    child: isLoading.value
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : const Text(
                            "Next",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
