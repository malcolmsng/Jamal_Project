import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/ui/add_exercise.dart';
import 'package:jamal_v1/ui/add_exercise.dart';
import 'package:jamal_v1/ui/suggester.dart';
import 'package:jamal_v1/ui/workout_plan.dart';
import 'package:jamal_v1/util/beginner_exercise_constants.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';
import 'package:jamal_v1/widgets/category_card.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/model/user_particulars.dart';
import 'dart:math';
import 'package:dotted_border/dotted_border.dart';

class DoWorkout extends StatefulWidget {
  final FitnessLevel userFitness;
  Workout bruh =
      Workout(rest: Duration(minutes: 1), exercises: [pushup, situp, squat]);

  DoWorkout({Key key, @required this.userFitness}) : super(key: key);

  @override
  _DoWorkoutState createState() => _DoWorkoutState();
}

class _DoWorkoutState extends State<DoWorkout> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  //from suggester
  final _multiformkey = GlobalKey<FormFieldState>();

  bool disabled = true;

  List<MultiSelectItem> equipment = Equipment.values
      .map((e) => MultiSelectItem<Equipment>(e, getEquipment(e)))
      .toList();

  List<Equipment> selectedEquipment = [];

  List<ex.Exercise> chestExercises;
  List<ex.Exercise> backExercises;
  List<ex.Exercise> legExercises;
  List<ex.Exercise> abExercises;
  List<ex.Exercise> tricepExercises;
  List<ex.Exercise> bicepExercises;
  List<ex.Exercise> shoulderExercises;
  List<ex.Exercise> cardioExercises;
  //temp workouts
  List<Map<String, Workout>> userAddedWorkouts = [
    {
      'bruh':
          Workout(rest: Duration(minutes: 1), exercises: [pushup, situp, squat])
    },
    {
      'nice':
          Workout(rest: Duration(minutes: 1), exercises: [pushup, situp, squat])
    },
    {
      'lelelel':
          Workout(rest: Duration(minutes: 1), exercises: [pushup, situp, squat])
    }
  ];

  //all exercises in list form;
  void initState() {
    userAddedWorkouts.add({'null': null});
    chestExercises = getSuitableExercises(ex.Focus.Chest);

    backExercises = getSuitableExercises(
      ex.Focus.Back,
    );
    legExercises = getSuitableExercises(
      ex.Focus.Legs,
    );
    abExercises = getSuitableExercises(
      ex.Focus.Abs,
    );
    tricepExercises = getSuitableExercises(
      ex.Focus.Tricep,
    );
    bicepExercises = getSuitableExercises(
      ex.Focus.Bicep,
    );
    shoulderExercises = getSuitableExercises(
      ex.Focus.Shoulder,
    );
    cardioExercises = getSuitableExercises(
      ex.Focus.Cardio,
    );

    super.initState();
  }

  int daysInWeek = 7;
  int weeksInMonth = 4;
//from suggestor

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      // bottomNavigationBar: BottomFeaturesBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/testbg2.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter)),
        width: screenSize.width,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Text(
              // insert user's name here
              "Add a workout",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Text("Choose an option below",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w400)),
            Padding(
              padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
              child: MultiSelectChipField<Equipment>(
                items: equipment,
                key: _multiformkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: BoxDecoration(color: Colors.transparent),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900),
                chipColor: Colors.white,
                validator: (values) {
                  return values.length < 1 ? 'Select at least one' : '';
                },
                showHeader: false,
                onTap: (values) {
                  setState(() {
                    selectedEquipment = values;
                    if (selectedEquipment.isEmpty) {
                      disabled = true;
                    } else {
                      disabled = false;
                    }
                  });

                  print(selectedEquipment);

                  _multiformkey.currentState.validate();
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              !disabled
                  ? ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      child: Text('Get Suggestions!'),
                      onPressed: () {
                        List<Workout> tempWorkout;
                        if (widget.userFitness == FitnessLevel.Beginner) {
                          tempWorkout = getBeginnerExercises();
                        } else if (widget.userFitness ==
                            FitnessLevel.Intermediate) {
                          tempWorkout = getIntermediateExercises();
                        } else {
                          tempWorkout = getAdvancedExercises();
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => SuggestedWorkout(),
                            builder: (context) => WorkoutPlan(),
                            settings: RouteSettings(arguments: tempWorkout),
                          ),
                        );
                      },
                    )
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(primary: Colors.grey),
                      child: Text('Get New Suggestions'),
                      onPressed: () {},
                    ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                child: Text('Current Suggestions'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExercisePage(),
                    ),
                  );
                },
              ),
            ]),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: userAddedWorkouts.length,
                  itemBuilder: (context, index) {
                    var current = userAddedWorkouts[index];

                    return current.keys.first == 'null' &&
                            current.values.first == null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DottedBorder(
                              color: Colors.black54,
                              radius: Radius.circular(16),
                              dashPattern: [8, 8],
                              borderType: BorderType.RRect,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Container(
                                      child: Material(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddExercisePage(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 40,
                                              semanticLabel: 'Add',
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 17),
                                            blurRadius: 17,
                                            spreadRadius: -23,
                                          ),
                                        ],
                                      ))),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryCard(
                              workout: current.values.first,
                              title: current.keys.first,
                              press: () {},
                            ),
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }

  List<ex.Exercise> getSuitableExercises(ex.Focus focus) {
    int difficultyLevel = widget.userFitness.index;
    return Workout.allExercises
        .where((exercise) =>
            exercise.focus.contains(focus) &&
            exercise.difficulty.index <= difficultyLevel)
        .toList();
  }

  List<Workout> getBeginnerExercises() {
//   Beginner:
// 2 Workouts per week:
// 1) Chest, Back, Legs, Abs
// 2) Shoulder, Bicep, Triceps, Legs, Abs
// Sets = weeksInMonth
// 10 <= Reps <= 20
// 10 <= Time <= 30

    chestExercises = chestExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    backExercises = backExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    legExercises = legExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    shoulderExercises = shoulderExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    bicepExercises = bicepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    tricepExercises = tricepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    cardioExercises = cardioExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    abExercises = abExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();

    int sets = 4;
    int minReps = 10;
    int minTime = 10;
    int repsIncrease = 2;
    int timeIncrease = 5;

    Random rnd = Random();

    List<ex.Exercise> weeklyExercise1 = [
      chestExercises[rnd.nextInt(chestExercises.length)],
      backExercises[rnd.nextInt(backExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];
    List<ex.Exercise> weeklyExercise2 = [
      shoulderExercises[rnd.nextInt(shoulderExercises.length)],
      bicepExercises[rnd.nextInt(bicepExercises.length)],
      tricepExercises[rnd.nextInt(tricepExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];
    weeklyExercise1.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });
    weeklyExercise2.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });
    Workout weeklyWorkout1 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise1);
    Workout weeklyWorkout2 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise2);

    List<Workout> weeklyWorkoutList = [weeklyWorkout1, weeklyWorkout2];
    List<Workout> monthlyWorkouts = [];

    for (int i = 0; i < weeksInMonth; i++) {
      //restdaysInWeek
      int interWeekMultiplier = 7 * i;
      for (Workout workout in weeklyWorkoutList) {
        int intraWeekMultiplier =
            (daysInWeek / weeklyWorkoutList.length).floor() *
                weeklyWorkoutList.indexOf(workout);

        Workout tempWorkout = workout.setDate(DateTime.now()
            .add(Duration(days: intraWeekMultiplier + interWeekMultiplier)));

        monthlyWorkouts.add(tempWorkout);
      }
    }
    UserParticulars.setCurrentWorkout = monthlyWorkouts;
    return monthlyWorkouts;
  }

  List<Workout> getIntermediateExercises() {
//     Intermediate:
// 3 Workouts per week:
// 1) Chest, Back, Legs, Abs
// 2) Shoulder, Bicep, Triceps, Legs, Abs
// 3) 3 x Cardio Exercises

// Sets = weeksInMonth
// 10 <= Reps <= 20
// 10 <= Time <= 30
    chestExercises = chestExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    backExercises = backExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    legExercises = legExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    shoulderExercises = shoulderExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    bicepExercises = bicepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    tricepExercises = tricepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    cardioExercises = cardioExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    abExercises = abExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();

    int sets = 4;
    int minReps = 10;
    int minTime = 10;
    int repsIncrease = 2;
    int timeIncrease = 5;

    Random rnd = Random();

    List<ex.Exercise> weeklyExercise1 = [
      chestExercises[rnd.nextInt(chestExercises.length)],
      backExercises[rnd.nextInt(backExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];
    List<ex.Exercise> weeklyExercise2 = [
      shoulderExercises[rnd.nextInt(shoulderExercises.length)],
      bicepExercises[rnd.nextInt(bicepExercises.length)],
      tricepExercises[rnd.nextInt(tricepExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];

    List<int> tempList = getRandomIntList(cardioExercises.length);
    List<ex.Exercise> weeklyExercise3 = [
      cardioExercises[tempList[0]],
      cardioExercises[tempList[1]],
      cardioExercises[tempList[2]],
    ];

    Workout weeklyWorkout1 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise1);
    Workout weeklyWorkout2 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise2);
    Workout weeklyWorkout3 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise3);

    weeklyExercise1.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    weeklyExercise2.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    weeklyExercise3.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    List<Workout> weeklyWorkoutList = [
      weeklyWorkout1,
      weeklyWorkout2,
      weeklyWorkout3
    ];

    List<Workout> monthlyWorkouts = [];

    for (int i = 0; i < weeksInMonth; i++) {
      //restdaysInWeek
      int interWeekMultiplier = 7 * i;
      for (Workout workout in weeklyWorkoutList) {
        int intraWeekMultiplier =
            (daysInWeek / weeklyWorkoutList.length).floor() *
                weeklyWorkoutList.indexOf(workout);

        Workout tempWorkout = workout.setDate(DateTime.now()
            .add(Duration(days: intraWeekMultiplier + interWeekMultiplier)));

        monthlyWorkouts.add(tempWorkout);
      }
    }
    UserParticulars.setCurrentWorkout = monthlyWorkouts;
    return monthlyWorkouts;
  }

  List<Workout> getAdvancedExercises() {
//     Advanced:
// 4 Workouts per week:
// 1) Chest, Back, Legs, Abs
// 2) Shoulder, Bicep, Triceps, Legs, Abs
// 3)  4 x Cardio Exercises
// 4) Chest, Back, Legs, Abs

// Sets = 5
// 10 <= Reps <= 20
// 10 <= Time <= 30

    chestExercises = chestExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    backExercises = backExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    legExercises = legExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    shoulderExercises = shoulderExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    bicepExercises = bicepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    tricepExercises = tricepExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    cardioExercises = cardioExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();
    abExercises = abExercises
        .where(
            (exercise) => selectedEquipment.contains(exercise.equipmentNeeded))
        .toList();

    int sets = 5;
    int minReps = 10;
    int minTime = 10;
    int repsIncrease = 2;
    int timeIncrease = 5;

    Random rnd = Random();

    List<ex.Exercise> weeklyExercise1 = [
      chestExercises[rnd.nextInt(chestExercises.length)],
      backExercises[rnd.nextInt(backExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];
    List<ex.Exercise> weeklyExercise2 = [
      shoulderExercises[rnd.nextInt(shoulderExercises.length)],
      bicepExercises[rnd.nextInt(bicepExercises.length)],
      tricepExercises[rnd.nextInt(tricepExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];

    List<int> tempList = getRandomIntList(cardioExercises.length);
    List<ex.Exercise> weeklyExercise3 = [
      cardioExercises[tempList[0]],
      cardioExercises[tempList[1]],
      cardioExercises[tempList[2]],
      cardioExercises[tempList[3]],
    ];

    List<ex.Exercise> weeklyExercise4 = [
      chestExercises[rnd.nextInt(chestExercises.length)],
      backExercises[rnd.nextInt(backExercises.length)],
      legExercises[rnd.nextInt(legExercises.length)],
      abExercises[rnd.nextInt(abExercises.length)],
    ];

    weeklyExercise1.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
      print(exercise.sets);
      print(exercise.reps);
    });

    weeklyExercise2.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    weeklyExercise3.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    weeklyExercise4.forEach((exercise) {
      exercise.sets = sets;
      if (exercise.isTimed) {
        exercise.time = Duration(seconds: minTime);
      } else {
        exercise.reps = minReps;
      }
    });

    Workout weeklyWorkout1 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise1);
    Workout weeklyWorkout2 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise2);
    Workout weeklyWorkout3 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise3);
    Workout weeklyWorkout4 =
        Workout(rest: Duration(minutes: 1), exercises: weeklyExercise4);

    List<Workout> weeklyWorkoutList = [
      weeklyWorkout1,
      weeklyWorkout2,
      weeklyWorkout3,
      weeklyWorkout4,
    ];

    List<Workout> monthlyWorkouts = [];

    for (int i = 0; i < weeksInMonth; i++) {
      //restdaysInWeek
      int interWeekMultiplier = 7 * i;
      for (Workout workout in weeklyWorkoutList) {
        int intraWeekMultiplier =
            (daysInWeek / weeklyWorkoutList.length).ceil() *
                weeklyWorkoutList.indexOf(workout);

        Workout tempWorkout = workout.setDate(DateTime.now()
            .add(Duration(days: intraWeekMultiplier + interWeekMultiplier)));

        monthlyWorkouts.add(tempWorkout);
      }
    }
    UserParticulars.setCurrentWorkout = monthlyWorkouts;
    return monthlyWorkouts;
  }
}

List<int> getRandomIntList(int x) {
  Random rnd = Random();
  Set<int> tempSet = Set();
  while (tempSet.length < x) {
    tempSet.add(rnd.nextInt(x));
  }
  return tempSet.toList();
}

void scrollAnimation(ScrollController controller) {
  // when using more than one animation, use async/await
  Future.delayed(const Duration(milliseconds: 500), () async {
    await controller.animateTo(controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 5000), curve: Curves.linear);

    await controller.animateTo(controller.position.minScrollExtent,
        duration: Duration(milliseconds: 1250),
        curve: Curves.fastLinearToSlowEaseIn);
  });
}
