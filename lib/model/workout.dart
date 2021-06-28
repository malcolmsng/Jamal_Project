import 'dart:ffi';

import 'package:jamal_v1/model/exercise.dart';
import 'package:flutter/material.dart';

class Workout {
  Duration rest; //rest between sets
  List<Exercise> exercises;
  List<int> sets;
  List<int> reps;
  List<int> time;
  DateTime date; //time per set

  Workout({
    @required this.rest,
    @required this.exercises,
    @required this.sets,
    @required this.reps,
    @required this.time,
    this.date,
  });

  List<Exercise> getWorkout() {
    for (int i; i < exercises.length; i++) {
      Exercise exercise = exercises[i];
      exercise.setSets = sets[i];
      if (exercise.reps == 0) {
        exercise.time = Duration(seconds: time[i]);
      } else {
        exercise.setReps = reps[i];
      }
    }
    return this.exercises;
  }
}
