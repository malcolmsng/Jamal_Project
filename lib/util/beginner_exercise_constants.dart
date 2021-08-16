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

ex.Exercise jumpingJacks = ex.Exercise(
  name: 'Jumping Jacks',
  focus: [ex.Focus.Cardio],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=UpH7rm0cYbM',
  picURL:
      'https://i.ytimg.com/vi/UpH7rm0cYbM/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBZmiY34NEkXNnKFGS-D3amZRiBUQ',
);

ex.Exercise ropeSkipping = ex.Exercise(
  name: 'Rope Skipping',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=FJmRQ5iTXKE',
  picURL:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUP4MVI4ITNsRLIOVsKFRgxpEwL9SefvHe3m9nElatAOYoduUlQCeTx0ZkNDPVtd0hHwE&usqp=CAU',
);

ex.Exercise weightedLunges = ex.Exercise(
  name: 'Weighted Lunges',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.noEquip,
  isWeighted: true,
  weight: 5,
  vidURL: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
  picURL:
      'https://static.toiimg.com/thumb/72167543.cms?width=680&height=512&imgsize=682166',
);

ex.Exercise hammerCurl = ex.Exercise(
  name: 'Hammer Curl',
  focus: [ex.Focus.Bicep],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.dumbbell,
  isWeighted: true,
  weight: 4,
  vidURL: 'https://www.youtube.com/watch?v=zC3nLlEvin4',
  picURL:
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hammer-curls-1581441441.jpg',
);

ex.Exercise assistedPullups = ex.Exercise(
  name: 'Assisted Pullups',
  focus: [ex.Focus.Back],
  difficulty: FitnessLevel.Beginner,
  equipmentNeeded: Equipment.resistanceBand,
  vidURL: 'https://www.youtube.com/watch?v=7yqudG7vnow',
  picURL:
      'https://thumbs.gfycat.com/GrossEvenBluebreastedkookaburra-size_restricted.gif',
);

List<ex.Exercise> beginnerExercises = [
  kneePushup,
  russianTwist,
  squat,
  plank,
  jumpingJacks,
  ropeSkipping,
  weightedLunges,
  hammerCurl,
  assistedPullups
];
