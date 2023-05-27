import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

import '../data/exercise_sets.dart';
import '../model/exercise_set.dart';
import 'exercise_set_widget.dart';

class ExerciseWidget extends StatefulWidget {
  const ExerciseWidget({super.key});

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  ExerciseType selectedType = ExerciseType.low;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSize.s16),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        const SizedBox(height: AppSize.s8),
        Text('Exercise',
            style: getBoldStyle(
                color: ColorManager.lightBlack, fontSize: AppSize.s20)),
        const SizedBox(height: AppSize.s8),
        buildDifficultyLevel(),
        const SizedBox(height: AppSize.s8),
        buildWorkouts()
      ])),
    );
  }

  Widget buildDifficultyLevel() => Row(
        children: ExerciseType.values.map(
          (type) {
            final name = getExerciseName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;
            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: fontWeight, fontSize: AppSize.s18),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  Widget buildWorkouts() => GestureDetector(
        onHorizontalDragEnd: swipeFunction,
        child: Column(
          children: exerciseSets
              .where((element) => element.exerciseType == selectedType)
              .map(
                (exerciseSet) => Container(
                    margin: const EdgeInsets.symmetric(vertical: AppSize.s10),
                    child: ExerciseSetWidget(exerciseSet: exerciseSet)),
              )
              .toList(),
        ),
      );

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity! < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity! > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
