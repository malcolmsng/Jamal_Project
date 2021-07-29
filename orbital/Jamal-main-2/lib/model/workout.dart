import 'dart:ffi';

import 'package:jamal_v1/model/exercise.dart';
import 'package:flutter/material.dart';

class Workout {
  Duration rest; //rest between sets
  List<Exercise> exercises;
  List<int> sets;
  List<int> reps;
  List<Duration> time; //time per set

  Workout({
    @required this.rest,
    @required this.exercises,
    @required this.sets,
    @required this.reps,
  });

  List<Exercise> getWorkout() {
    for (int i; i < exercises.length; i++) {
      Exercise exercise = exercises[i];
      exercise.setSets = sets[i];
      if (exercise.reps == null) {
        exercise.time = time[i];
      } else {
        exercise.setReps = reps[i];
      }
    }
  }
}
