import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:video_player/video_player.dart';

import '../models/first_aid_model.dart';

class TipsScreen extends StatefulWidget {
  final FirstAidModel firstAidModel;
  const TipsScreen({super.key, required this.firstAidModel});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  VideoPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(widget.firstAidModel.videoUrl)
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController!.play();
          });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.firstAidModel.name),
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _videoPlayerController!.value.isInitialized
              ? Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!)),
                    VideoProgressIndicator(
                      _videoPlayerController!,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                          backgroundColor: ColorManager.error,
                          bufferedColor: ColorManager.lightBlack,
                          playedColor: ColorManager.lightBlue),
                    ),
                  ],
                )
              : Container(),
          const Padding(padding: EdgeInsets.all(AppSize.s8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.withOpacity(0.6)),
                      fixedSize: MaterialStateProperty.all(
                          const Size(AppSize.s50, AppSize.s50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s100)))),
                  onPressed: () {
                    _videoPlayerController!.pause();
                  },
                  child: const Icon(Icons.pause)),
              const Padding(padding: EdgeInsets.all(2)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.withOpacity(0.9)),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(AppSize.s50, AppSize.s50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s100)))),
                  onPressed: () {
                    _videoPlayerController!.play();
                  },
                  child: const Icon(Icons.play_arrow)),
              const Padding(padding: EdgeInsets.all(2)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.withOpacity(0.6)),
                      fixedSize: MaterialStateProperty.all(
                          const Size(AppSize.s50, AppSize.s50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s100)))),
                  onPressed: () {
                    _videoPlayerController!.seekTo(Duration(
                        seconds:
                            _videoPlayerController!.value.position.inSeconds +
                                10));
                  },
                  child: const Icon(Icons.fast_forward))
            ],
          ),
          const SizedBox(height: AppSize.s10),
          Container(
            margin: const EdgeInsets.all(AppSize.s14),
            padding: const EdgeInsets.all(AppSize.s10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.firstAidModel.color),
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s14),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.firstAidModel.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: AppSize.s18, fontWeight: FontWeight.w400))
                  ]),
            ),
          )
        ])));
  }
}
