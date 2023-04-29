import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/fitness_app/model/exetcise_model.dart';

class VideoControlsWidget extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  const VideoControlsWidget({
    super.key,
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: Colors.white.withOpacity(0.95),
        ),
        height: 142,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText(
                  title: 'Duration',
                  value: '${exercise.duration!.inSeconds} Seconds',
                ),
                buildText(
                  title: 'Reps',
                  value: '${exercise.noOfReps} times',
                ),
              ],
            ),
            buildButtons(context),
          ],
        ),
      );

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppSize.s16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.fast_rewind,
              color: Colors.black87,
              size: AppSize.s32,
            ),
            onPressed: onRewindVideo,
          ),
          buildPlayButton(context),
          IconButton(
            icon: const Icon(
              Icons.fast_forward,
              color: Colors.black87,
              size: AppSize.s32,
            ),
            onPressed: onNextVideo,
          ),
        ],
      );

  Widget buildPlayButton(BuildContext context) {
    final isLoading = exercise.controller == null ||
        !exercise.controller!.value.isInitialized;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (exercise.controller!.value.isPlaying) {
      return buildButton(
        context,
        icon: const Icon(Icons.pause, size: AppSize.s30, color: Colors.white),
        onClicked: () => onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: const Icon(Icons.play_arrow,
            size: AppSize.s30, color: Colors.white),
        onClicked: () => onTogglePlaying(true),
      );
    }
  }

  Widget buildButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFFff6369),
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: AppSize.s24,
            backgroundColor: const Color(0xFFff6369),
            child: icon,
          ),
        ),
      );
}
