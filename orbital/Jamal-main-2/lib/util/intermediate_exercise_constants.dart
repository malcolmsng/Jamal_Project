import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/util/advanced_exercise_constants.dart';
import 'package:jamal_v1/util/equipment_constants.dart';

import 'beginner_exercise_constants.dart';

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

ex.Exercise jumpSquat = ex.Exercise(
  name: 'Jump Squat',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=0LGJZqKfpXs',
  picURL:
      'https://www.oxygenmag.com/wp-content/uploads/2020/09/level-1.jpg?width=730',
);

ex.Exercise toeTouches = ex.Exercise(
    name: 'Toe Touches',
    focus: [ex.Focus.Abs],
    difficulty: FitnessLevel.Intermediate,
    equipmentNeeded: noEquip,
    vidURL: 'https://www.youtube.com/watch?v=y6Bv_0Shhc8',
    picURL:
        'https://media1.popsugar-assets.com/files/thumbor/6MmclGB9DFm01WPF4Pk67cMU-KM/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/10/19/950/n/1922729/da46d3485bca514ddc3ac5.05075484_Toe-Touches-redo/i/Tabata-Six-Toe-Touch-Crunch.jpg');

List<List<ex.Exercise>> difficultyLevel = [
  beginnerExercises,
  intermediateExercises,
  advancedExercises
];

List<ex.Exercise> intermediateExercises = [
  pushup,
  situp,
  jumpSquat,
  toeTouches
];
