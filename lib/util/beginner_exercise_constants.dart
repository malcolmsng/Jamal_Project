// import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/model/equipment.dart';

ex.Exercise kneePushup = ex.Exercise(
  name: 'Knee Pushup',
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.noEquip,
  focus: [ex.Focus.Chest, ex.Focus.Tricep],
  vidURL: 'https://www.youtube.com/watch?v=utzhPQuXWcA',
  picURL:
      'https://i.ytimg.com/vi/WcHtt6zT3Go/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDy53LM3P-k13Qc80nn8w87eObpDA',
);

ex.Exercise russianTwist = ex.Exercise(
  name: 'Russian Twist',
  difficulty: FitnessLevel.Beginner,
  focus: [ex.Focus.Abs],
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=wkD8rjkodUI',
  picURL:
      'https://cdn1.coachmag.co.uk/sites/coachmag/files/2016/07/russian-twist.jpg',
);

ex.Exercise squat = ex.Exercise(
    name: 'Squat',
    focus: [ex.Focus.Legs],
    difficulty: FitnessLevel.Beginner,
    equipmentNeeded: Equipment.noEquip,
    vidURL: 'https://www.youtube.com/watch?v=0KtrNQre5rQ',
    picURL:
        'https://1fsawj22yir9otqyf1vuai46-wpengine.netdna-ssl.com/wp-content/uploads/sites/32/2017/06/Screen-Shot-2017-06-22-at-3.25.47-PM-1024x640.png');

ex.Exercise plank = ex.Exercise(
  name: 'Plank',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=y6Bv_0Shhc8',
  picURL:
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hdm119918mh15842-1545237096.png?crop=1.00xw:0.752xh;0,0.248xh&resize=1200:*',
);

List<ex.Exercise> beginnerExercises = [kneePushup, russianTwist, squat, plank];
