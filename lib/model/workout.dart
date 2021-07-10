import 'package:jamal_v1/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/util/advanced_exercise_constants.dart';
import 'package:jamal_v1/util/beginner_exercise_constants.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';

class Workout {
  Duration rest; //rest between sets
  List<Exercise> exercises;
  List<int> sets;
  List<int> reps;
  List<int> time;
  DateTime date; //time per set
  static List<Exercise> allExercises = [
    ...beginnerExercises,
    ...intermediateExercises,
    ...advancedExercises
  ];

  Workout({
    @required this.rest,
    @required this.exercises,
    this.sets,
    this.reps,
    this.time,
    this.date,
  });

  Workout setDate(DateTime dt) {
    List<Exercise> tempList = List<Exercise>.from(this.exercises);
    tempList.forEach((exercise) {
      exercise.date = dt;
    });
    Workout temp = Workout(rest: this.rest, exercises: tempList, date: dt);

    return temp;
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
