// import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/model/equipment.dart';

ex.Exercise pikePushup = ex.Exercise(
  name: 'Pike Pushup',
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  focus: [ex.Focus.Shoulder, ex.Focus.Chest, ex.Focus.Tricep],
  vidURL: 'https://www.youtube.com/watch?v=sposDXWEB0A',
  picURL:
      'https://i.ytimg.com/vi/sposDXWEB0A/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCadRnSpQdJeRgN7LyMVIfuqNnKgA',
);

ex.Exercise pistolSquat = ex.Exercise(
  name: 'Pistol Squat',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=PZlLHZ4Venw',
  picURL:
      'https://i.ytimg.com/vi/PZlLHZ4Venw/hqdefault.jpg?sqp=-oaymwEjCOADEI4CSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLDYz18iyuRO2XqzPR9kDT8R-UCtdQ',
);

ex.Exercise pullup = ex.Exercise(
    name: 'Pull Ups',
    focus: [ex.Focus.Back],
    difficulty: FitnessLevel.Advanced,
    equipmentNeeded: Equipment.noEquip,
    vidURL: 'https://www.youtube.com/watch?v=XeErfmGSwfE',
    picURL:
        'https://i.ytimg.com/vi/XeErfmGSwfE/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBCzS_w8uERxMwnxvt0YCOYHjah5w');

ex.Exercise handstandPushUp = ex.Exercise(
  name: 'Handstand Pushup',
  focus: [ex.Focus.Shoulder],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=FaRge9WFzWg',
  picURL:
      'https://wodstarmedia.s3.amazonaws.com/wp-content/uploads/2015/05/hspu-zapoli.jpg',
);

ex.Exercise bicepCurl = ex.Exercise(
  name: 'Bicep Curl',
  focus: [ex.Focus.Bicep],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=in7PaeYlhrM',
  picURL:
      'https://i.ytimg.com/vi/in7PaeYlhrM/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD8jpJiJQFJmFGhQT6MgWDuYKZGJg',
);

//cardio

ex.Exercise burpees = ex.Exercise(
  name: 'Burpees',
  focus: [ex.Focus.Cardio],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL:
      'https://www.youtube.com/watch?v=TU8QYVW0gDU&ab_channel=CrossFit%C2%AE',
  picURL:
      'https://post.healthline.com/wp-content/uploads/2019/09/Athletes-doing-burpee-exercise-in-crossfit-gym-732x549-thumbnail.jpg',
);

//abs
ex.Exercise lSit = ex.Exercise(
  name: 'L-Sit',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL:
      'https://www.youtube.com/watch?v=IUZJoSP66HI&ab_channel=AntranikDotOrg',
  picURL: 'https://cdn.gmb.io/wp-content/uploads/2017/09/Ryan-Lsit.jpg',
);

ex.Exercise bicycle = ex.Exercise(
  name: 'Bicycle Crunches',
  difficulty: FitnessLevel.Advanced,
  focus: [ex.Focus.Abs],
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=9FGilxCbdz8',
  picURL:
      'https://i.ytimg.com/vi/9FGilxCbdz8/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCdBxIRysqn73QqVE_XGrNFDmjJWA',
);

ex.Exercise hangingLegRaises = ex.Exercise(
  name: 'Hanging Leg Raises',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.pullUpBar,
  vidURL:
      'https://www.youtube.com/watch?v=Pr1ieGZ5atk&ab_channel=ATHLEAN-X%E2%84%A2',
  picURL: 'https://miro.medium.com/max/1838/0*Mly7U-TaaUvMxnpW',
);

ex.Exercise deadlift = ex.Exercise(
  name: 'Deadlift',
  focus: [ex.Focus.Back, ex.Focus.Legs, ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.barbell,
  vidURL: 'https://www.youtube.com/watch?v=ytGaGIn3SjE',
  picURL: 'https://static.toiimg.com/photo/76287149.cms',
);

ex.Exercise overheadPress = ex.Exercise(
  name: 'Overhead Press',
  focus: [ex.Focus.Shoulder],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.barbell,
  vidURL: 'https://www.youtube.com/watch?v=_RlRDWO2jfg',
  picURL:
      'https://cdn.shopify.com/s/files/1/1283/2557/files/Benefits_Of_Overhead_Press_1024x1024.jpg?v=1616477593',
);

ex.Exercise skullcrusher = ex.Exercise(
  name: 'Skullcrusher',
  focus: [ex.Focus.Tricep],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.barbell,
  vidURL: 'https://www.youtube.com/watch?v=d_KZxkY_0cM',
  picURL:
      'https://www.bodybuilding.com/fun/images/2015/your-complete-guide-to-skullcrushers-graphics-1-700xh.jpg',
);

List<ex.Exercise> advancedExercises = [
  pikePushup,
  bicycle,
  pistolSquat,
  pullup,
  handstandPushUp,
  bicepCurl,
  burpees,
  lSit,
  hangingLegRaises,
  deadlift,
  overheadPress,
  skullcrusher
];
