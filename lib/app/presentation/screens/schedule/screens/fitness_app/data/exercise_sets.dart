import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';

import '../model/exercise_set.dart';
import 'exercise_data.dart';

final exerciseSets = [
  ExerciseSet(
    name: 'Core',
    exercises: exercises1,
    imageUrl: ImageAsset.workout_1Image,
    exerciseType: ExerciseType.low,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises3,
    imageUrl: ImageAsset.crunchImage,
    exerciseType: ExerciseType.low,
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Upper Body',
    exercises: exercises1,
    imageUrl: ImageAsset.puchupImage,
    exerciseType: ExerciseType.low,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises2,
    imageUrl: ImageAsset.yogaImage,
    exerciseType: ExerciseType.low,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Cardio',
    exercises: exercises3,
    imageUrl: ImageAsset.workout_3Image,
    exerciseType: ExerciseType.low,
    color: Colors.red.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Stretching',
    exercises: exercises4,
    imageUrl: ImageAsset.workout_2Image,
    exerciseType: ExerciseType.mid,
    color: Colors.pink.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Core',
    exercises: exercises2,
    imageUrl: ImageAsset.workout_3Image,
    exerciseType: ExerciseType.mid,
    color: Colors.yellowAccent.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Cardio',
    exercises: exercises3,
    imageUrl: ImageAsset.workout_1Image,
    exerciseType: ExerciseType.mid,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises1,
    imageUrl: ImageAsset.yogaImage,
    exerciseType: ExerciseType.mid,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises1,
    imageUrl: ImageAsset.crunchImage,
    exerciseType: ExerciseType.mid,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Shoulder',
    exercises: exercises2,
    imageUrl: ImageAsset.puchupImage,
    exerciseType: ExerciseType.mid,
    color: Colors.teal.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Acrobatic',
    exercises: exercises2,
    imageUrl: ImageAsset.workout_3Image,
    exerciseType: ExerciseType.hard,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Hands',
    exercises: exercises2,
    imageUrl: ImageAsset.puchupImage,
    exerciseType: ExerciseType.hard,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises4,
    imageUrl: ImageAsset.crunchImage,
    exerciseType: ExerciseType.hard,
    color: Colors.teal.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Core',
    exercises: exercises1,
    imageUrl: ImageAsset.workout_2Image,
    exerciseType: ExerciseType.hard,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises3,
    imageUrl: ImageAsset.yogaImage,
    exerciseType: ExerciseType.hard,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
];
