import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../model/exetcise_model.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Exercise exercise;
  final VoidCallback onInitialized;

  const VideoPlayerWidget({
    super.key,
    required this.exercise,
    required this.onInitialized,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.exercise.videoUrl!)
      ..initialize().then((value) {
        controller!.setLooping(true);
        controller!.play();

        widget.exercise.controller = controller;
        widget.onInitialized();
      });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: controller!.value.isInitialized
            ? VideoPlayer(controller!)
            : const Center(child: CircularProgressIndicator()),
      );
}
