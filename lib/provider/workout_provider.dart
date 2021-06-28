import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/workout.dart';

class WorkoutProvider extends ChangeNotifier {
  List<Workout> workouts = [];

  void addWorkout(Workout workout) {
    workouts.add(workout);
    notifyListeners();
  }
}
