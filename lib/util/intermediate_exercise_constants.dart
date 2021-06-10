import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/util/equipment_constants.dart';

ex.Exercise pushup = ex.Exercise(
  name: 'Pushup',
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  focus: [ex.Focus.Chest, ex.Focus.Tricep],
  vidURL:
      'https://www.youtube.com/watch?v=IODxDxX7oi4&t=2s&ab_channel=Calisthenicmovement',
  picURL:
      'https://assets.gqindia.com/photos/5cee7eb00379a73d25177759/master/pass/Pushup.jpg',
);

ex.Exercise situp = ex.Exercise(
  name: 'Situp',
  difficulty: FitnessLevel.Intermediate,
  focus: [ex.Focus.Abs],
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=s3PPU_2z9qo',
  picURL:
      'https://www.mensjournal.com/wp-content/uploads/mf/jandarot.jpg?quality=86&strip=all',
);

ex.Exercise squat = ex.Exercise(
  name: 'Squat',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=0KtrNQre5rQ',
  picURL:
      'https://cathe.com/wp-content/uploads/2020/07/shutterstock_1130977049.jpg',
);

ex.Exercise plank = ex.Exercise(
  name: 'Plank',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=ASdvN_XEl_c',
  picURL:
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hdm119918mh15842-1545237096.png?crop=1.00xw:0.752xh;0,0.248xh&resize=1200:*',
);

List<ex.Exercise> intermediate = [pushup, situp, squat, plank];
