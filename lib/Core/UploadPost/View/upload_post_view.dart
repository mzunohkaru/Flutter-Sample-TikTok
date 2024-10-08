import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/TabBar/main_tab_view.dart';
import 'package:tiktok_clone/Core/UploadPost/ViewModel/upload_post_view_model.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class UploadPostView extends HookConsumerWidget {
  final File videoFile;
  final File videoThumbnailFile;
  final viewModel = UploadPostViewModel();

  UploadPostView(
      {super.key,
      required this.videoFile,
      required this.videoThumbnailFile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    final captionController = useTextEditingController();
    final isValidation = useState(false);
    useEffect(() {
      void listener() {
        isValidation.value = captionController.text.isNotEmpty;
      }

      captionController.addListener(listener);
      return () {
        captionController.removeListener(listener);
      };
    }, [captionController]);

    void reset() {
      captionController.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainTabView(),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Upload Post", style: kAppBarTitleTextStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 180 / 180,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: videoThumbnailFile != null
                        ? DecorationImage(
                            image: FileImage(videoThumbnailFile),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: videoThumbnailFile != null
                      ? null
                      : const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 80,
                        ),
                ),
              ),
              TextField(
                controller: captionController,
                decoration: const InputDecoration(
                  hintText: "Caption..",
                ),
                maxLines: 2,
                maxLength: 30,
              ),
              const Spacer(),
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
                  onPressed: isValidation.value && !isLoading.value
                      ? () async {
                          isLoading.value = true;

                          await viewModel.uploadPost(
                              ref: ref,
                              caption: captionController.text,
                              videoFile: videoFile,
                              videoThumbnailFile: videoThumbnailFile);

                          isLoading.value = false;

                          reset();
                        }
                      : null,
                  child: isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text(
                          "Upload",
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
