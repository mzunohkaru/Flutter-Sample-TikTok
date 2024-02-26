import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  late bool isPause;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
      });

    isPause = false;
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  void pause() {
    setState(() {
      isPause = !isPause;
    });

    if (isPause) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        pause();
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController),
            isPause
                ? Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 110,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
