import 'package:jamal_v1/model/workout.dart';

class UserParticulars {
  final String name;
  final String age;
  final String height;
  final String weight;
  final String fitnessLevel;
  static List<Workout> currentWorkout;

  UserParticulars({
    this.name,
    this.age,
    this.height,
    this.weight,
    this.fitnessLevel,
  });

  static set setCurrentWorkout(List<Workout> workouts) {
    UserParticulars.currentWorkout = workouts;
  }
}
