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

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
      });

    isIcon = false;
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

//追加？？？？
  bool isPlay = true;
  bool isIcon = false;
  void OnPause() {
    setState(() {
      isPlay = !isPlay;
    });

    if (isPlay) {
      isIcon = true;
      videoPlayerController.pause();
    } else {
      isIcon = false;
      videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        OnPause();
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
            isIcon
                ? const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 90,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
