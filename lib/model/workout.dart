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
    this.sets,
    this.reps,
    this.time,
    this.date,
  });

  void setDate(DateTime dt) {
    this.date = dt;
    for (Exercise e in exercises) {
      e.date = dt;
    }
  }

  List<Exercise> getWorkout() {
    for (int i; i < exercises.length; i++) {
      Exercise exercise = exercises[i];
      exercise.sets = sets[i];
      if (exercise.reps == 0) {
        exercise.time = Duration(seconds: time[i]);
      } else {
        exercise.reps = reps[i];
      }
    }
    return this.exercises;
  }

  @override
  String toString() {
    return exercises.map((e) => e.toString()).toList().join(', ');
  }
}
