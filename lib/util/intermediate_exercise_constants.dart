// import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/model/equipment.dart';

ex.Exercise pushup = ex.Exercise(
  name: 'Pushup',
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.noEquip,
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
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=s3PPU_2z9qo',
  picURL:
      'https://www.mensjournal.com/wp-content/uploads/mf/jandarot.jpg?quality=86&strip=all',
);

ex.Exercise jumpSquat = ex.Exercise(
  name: 'Jump Squat',
  focus: [ex.Focus.Legs, ex.Focus.Cardio],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=0LGJZqKfpXs',
  picURL:
      'https://www.oxygenmag.com/wp-content/uploads/2020/09/level-1.jpg?width=730',
);

ex.Exercise toeTouches = ex.Exercise(
    name: 'Toe Touches',
    focus: [ex.Focus.Abs],
    difficulty: FitnessLevel.Intermediate,
    equipmentNeeded: Equipment.noEquip,
    vidURL: 'https://www.youtube.com/watch?v=y6Bv_0Shhc8',
    picURL:
        'https://media1.popsugar-assets.com/files/thumbor/6MmclGB9DFm01WPF4Pk67cMU-KM/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/10/19/950/n/1922729/da46d3485bca514ddc3ac5.05075484_Toe-Touches-redo/i/Tabata-Six-Toe-Touch-Crunch.jpg');

ex.Exercise lateralRaises = ex.Exercise(
  name: 'Lateral Raises',
  focus: [ex.Focus.Shoulder],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.dumbbell,
  vidURL: 'https://www.youtube.com/watch?v=3VcKaXpzqRo',
  picURL:
      'https://www.oxygenmag.com/wp-content/uploads/2020/09/level-1.jpg?width=730',
);

ex.Exercise waiterCurl = ex.Exercise(
  name: 'Waiter Curl',
  focus: [ex.Focus.Bicep],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.dumbbell,
  vidURL: 'https://www.youtube.com/watch?v=tQRlbZ48U_I',
  picURL:
      'http://s3.amazonaws.com/prod.skimble/assets/2289782/image_iphone.jpg',
);

ex.Exercise jumpingLunges = ex.Exercise(
  name: 'Jumping Lunges',
  focus: [
    ex.Focus.Cardio,
    ex.Focus.Legs,
  ],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=y7Iug7eC0dk&ab_channel=Howcasts',
  picURL:
      'https://evofitness.at/wp-content/uploads/2020/02/EVO-2020-PP-March-Banner_23-1200x675.jpg',
);

ex.Exercise mountainClimbers = ex.Exercise(
  name: 'Mountain Climbers',
  focus: [ex.Focus.Cardio, ex.Focus.Abs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=cnyTQDSE884&ab_channel=Well%2BGood',
  picURL:
      'https://images.contentstack.io/v3/assets/blt45c082eaf9747747/blt33111a792c501fac/5f8847051252ff30caf61e7f/FL_1_Blog-Header-Pics_1232-x-630_V1_climbers.jpg?format=pjpg&auto=webp&fit=crop&quality=76&width=1232&height=496',
);

ex.Exercise legRaises = ex.Exercise(
  name: 'Leg Raises',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=l4kQd9eWclE&ab_channel=Howcast',
  picURL:
      'https://www.bodybuilding.com/images/2020/xdb/originals/xdb-63a-lying-leg-lift-m2-16x9.jpg',
);

ex.Exercise latsPulldown = ex.Exercise(
  name: 'Lats Pulldown',
  focus: [ex.Focus.Back, ex.Focus.Bicep],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.cables,
  vidURL: 'https://www.youtube.com/watch?v=CAwf7n6Luuc',
  picURL: 'https://blog.nasm.org/hubfs/lat-pulldown.jpg',
);

ex.Exercise tBarRow = ex.Exercise(
  name: 'T-Bar Row',
  focus: [ex.Focus.Back],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.barbell,
  vidURL: 'https://www.youtube.com/watch?v=j3Igk5nyZE4',
  picURL: 'https://cdn.muscleandstrength.com/sites/default/files/t-bar-row.jpg',
);

ex.Exercise tricepExtension = ex.Exercise(
  name: 'Tricep Extension',
  focus: [ex.Focus.Tricep],
  difficulty: FitnessLevel.Intermediate,
  equipmentNeeded: Equipment.dumbbell,
  vidURL: 'https://www.youtube.com/watch?v=_gsUck-7M74',
  picURL:
      'https://qph.fs.quoracdn.net/main-qimg-4242b1f3d494037521ea69122fbf19c4',
);

List<ex.Exercise> intermediateExercises = [
  pushup,
  situp,
  jumpSquat,
  toeTouches,
  lateralRaises,
  waiterCurl,
  jumpingLunges,
  mountainClimbers,
  legRaises,
  latsPulldown,
  tBarRow,
  tricepExtension
];
