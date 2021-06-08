import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/model/fitness.dart';

enum Focus {
  Chest,
  Back,
  Bicep,
  Tricep,
  Legs,
  Abs,
  Cardio,
}

String getFocus(Focus focus) {
  switch (focus) {
    case Focus.Chest:
      return 'Chest';
      break;
    case Focus.Back:
      return 'Back';
      break;
    case Focus.Bicep:
      return 'Bicep';
      break;
    case Focus.Tricep:
      return 'Tricep';
      break;
    case Focus.Legs:
      return 'Legs';
      break;
    case Focus.Abs:
      return 'Abs';
      break;
    case Focus.Cardio:
      return 'Cardio';
      break;
  }
}

class Exercise {
  String picURL;
  String vidURL;
  FitnessLevel difficulty;
  Equipment equipmentNeeded;
  String name;
  int reps;
  int sets;
  Focus focus;
  Duration time; //time per set

  Exercise({
    this.picURL,
    this.vidURL,
    this.difficulty,
    this.equipmentNeeded,
    this.name,
    this.sets = 1,
    this.reps,
    this.focus,
    this.time, //seconds per set
  });
  //setters
  set _reps(int x) {
    this.reps = x;
  }

  set _sets(int x) {
    this.sets = x;
  }
  //getters

  String get _picURL {
    return this.picURL;
  }

  String get _vidURL {
    return this.vidURL;
  }

  Duration totalWorkTime() {
    int totalSeconds = this.time.inSeconds * this.sets;
    int seconds = totalSeconds % 60;
    int minutes = totalSeconds ~/ 60;
    return Duration(
      seconds: seconds,
      minutes: minutes,
    );
  }
}
