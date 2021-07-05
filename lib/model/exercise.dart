import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:flutter/material.dart';

enum Focus {
  Chest,
  Back,
  Shoulder,
  Bicep,
  Tricep,
  Legs,
  Abs,
  Cardio,
}

// getColour()
Color getColour(Focus focus) {
  switch (focus) {
    case Focus.Chest:
      return Color(0xffffcdd2);
      break;
    case Focus.Back:
      return Color(0xffe1bee7);
      break;
    case Focus.Shoulder:
      return Color(0xffcfdbdc);
      break;
    case Focus.Legs:
      return Color(0xffb3e5fc);
      break;
    case Focus.Bicep:
      return Color(0xffb2dfdb);
      break;
    case Focus.Tricep:
      return Color(0xfffff9c4);
      break;
    case Focus.Abs:
      return Color(0xffffe0b2);
      break;
    case Focus.Cardio:
      return Color(0xffd7ccc8);
      break;
  }
  return Color(0xffd7ccc8);
}

//creating a new method that Focus can use
extension on Focus {
  int compareTo(Focus other) => this.index.compareTo(other.index);
}

String getFocus(Focus focus) {
  switch (focus) {
    case Focus.Chest:
      return 'Chest';
      break;
    case Focus.Back:
      return 'Back';
      break;
    case Focus.Shoulder:
      return 'Shoulder';
      break;
    case Focus.Legs:
      return 'Legs';
      break;
    case Focus.Bicep:
      return 'Bicep';
      break;
    case Focus.Tricep:
      return 'Tricep';
      break;
    case Focus.Abs:
      return 'Abs';
      break;
    case Focus.Cardio:
      return 'Cardio';
      break;
  }
  return "No focus area added";
}

class Exercise {
  String picURL;
  String vidURL;
  FitnessLevel difficulty;
  Equipment equipmentNeeded;
  String name;
  int reps;
  int sets;
  List<Focus> focus;
  Duration time; //time per set
  bool isTimed;
  DateTime date;

  Exercise({
    this.picURL,
    this.vidURL,
    this.difficulty,
    this.equipmentNeeded,
    this.name,
    this.sets = 1,
    this.reps,
    this.focus,
    this.time,
    this.isTimed = false,
    this.date
  }) {
    this.sortFocus();
  }

  //setters
  set setReps(int x) {
    this.reps = x;
  }

  set setSets(int x) {
    this.sets = x;
  }
  //getters

  Duration totalWorkTime() {
    int totalSeconds = this.time.inSeconds * this.sets;
    int seconds = totalSeconds % 60;
    int minutes = totalSeconds ~/ 60;
    return Duration(
      seconds: seconds,
      minutes: minutes,
    );
  }

  void sortFocus() {
    if (focus.length > 1) {
      focus.sort((a, b) => a.compareTo(b));
    }
  }
}
