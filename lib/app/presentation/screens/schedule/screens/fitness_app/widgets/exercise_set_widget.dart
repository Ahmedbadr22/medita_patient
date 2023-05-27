import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

import '../model/exercise_set.dart';
import '../screens/exercise_screen.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({
    super.key,
    required this.exerciseSet,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExercisePage(exerciseSet: exerciseSet),
        )),
        child: Container(
          padding: const EdgeInsets.all(AppSize.s16),
          height: AppSize.s100,
          decoration: BoxDecoration(
            color: exerciseSet.color,
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Row(
            children: [
              Expanded(flex: 3, child: buildText()),
              Expanded(child: Image.asset(exerciseSet.imageUrl))
            ],
          ),
        ),
      );

  Widget buildText() {
    final exercises = exerciseSet.exercises.length;
    final minutes = exerciseSet.totalDuration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          exerciseSet.name,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: AppSize.s20),
        ),
        const SizedBox(height: AppSize.s10),
        Text('$exercises Exercises $minutes Mins'),
      ],
    );
  }
}
