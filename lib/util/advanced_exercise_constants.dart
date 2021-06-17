// import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/util/equipment_constants.dart';

ex.Exercise pikePushup = ex.Exercise(
  name: 'Pike Pushup',
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  focus: [ex.Focus.Chest, ex.Focus.Tricep],
  vidURL: 'https://www.youtube.com/watch?v=sposDXWEB0A',
  picURL:
      'https://i.ytimg.com/vi/sposDXWEB0A/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCadRnSpQdJeRgN7LyMVIfuqNnKgA',
);

ex.Exercise bicycle = ex.Exercise(
  name: 'Bicycle Crunches',
  difficulty: FitnessLevel.Intermediate,
  focus: [ex.Focus.Abs],
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=9FGilxCbdz8',
  picURL:
      'https://i.ytimg.com/vi/9FGilxCbdz8/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCdBxIRysqn73QqVE_XGrNFDmjJWA',
);

ex.Exercise pistolSquat = ex.Exercise(
  name: 'Pistol Squat',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: noEquip,
  vidURL: 'https://www.youtube.com/watch?v=PZlLHZ4Venw',
  picURL:
      'https://i.ytimg.com/vi/PZlLHZ4Venw/hqdefault.jpg?sqp=-oaymwEjCOADEI4CSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLDYz18iyuRO2XqzPR9kDT8R-UCtdQ',
);

ex.Exercise pullup = ex.Exercise(
    name: 'Pull Ups',
    focus: [ex.Focus.Back],
    difficulty: FitnessLevel.Intermediate,
    equipmentNeeded: noEquip,
    vidURL: 'https://www.youtube.com/watch?v=XeErfmGSwfE',
    picURL:
        'https://i.ytimg.com/vi/XeErfmGSwfE/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBCzS_w8uERxMwnxvt0YCOYHjah5w');

List<ex.Exercise> advancedExercises = [
  pikePushup,
  bicycle,
  pistolSquat,
  pullup
];
