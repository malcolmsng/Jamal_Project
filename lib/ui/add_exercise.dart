import 'package:flutter/material.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamal_v1/ui/do_workout.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:jamal_v1/util/advanced_exercise_constants.dart';
import 'package:jamal_v1/util/beginner_exercise_constants.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/widgets/add_exercise_card.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/widgets/search_exercises.dart';
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddExercisePage extends StatefulWidget {
  @override
  _AddExercisePageState createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  FitnessLevel selectedFitness = FitnessLevel.Beginner;
  String query = '';
  List<ex.Exercise> selectedExercises = beginnerExercises;

  List<ex.Exercise> addedExercises = [];

  int selectedSets = 4;
  int selectedReps = 10;
  int selectedWeight = 60;
  int selectedTime = 1;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (selectedFitness.toString() == "FitnessLevel.Beginner") {
      selectedExercises = beginnerExercises;
    } else if (selectedFitness.toString() == "FitnessLevel.Intermediate") {
      selectedExercises = intermediateExercises;
    } else {
      selectedExercises = advancedExercises;
    }

    List<ex.Exercise> filteredExercises = selectedExercises.where((exercise) {
      final searchLower = query.toLowerCase();
      final exerciseName = exercise.name.toLowerCase();
      return exerciseName.contains(searchLower);
    }).toList();

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
        child: Text(
          'Add Workout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          Workout tempWorkout =
              Workout(rest: Duration(minutes: 1), exercises: addedExercises);

          //added to list of workouts on firebase;
          showDialog(
              context: context,
              builder: (_) {
                return buildDialog(context: context, workout: tempWorkout);
              });
        },
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/testbg2.png',
              colorBlendMode: BlendMode.overlay,
            ),
          ),
          CustomScrollView(slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 60,
                ),
                buildSearch(),
                buildFitnessLevels(context),
                SizedBox(
                  height: 8,
                ),
                buildExercise(filteredExercises),
              ])),
            ),
            //ExerciseCard(exercise: pushup)
          ]),
        ],
      ),
    );
  }

  Widget buildFitnessLevels(context) {
    return Row(
      children: FitnessLevel.values.map(
        (fitness) {
          String name = Enums.enumToString(fitness);
          FontWeight font =
              fitness == selectedFitness ? FontWeight.bold : FontWeight.normal;

          return Expanded(
            child: Center(
                child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() => selectedFitness = fitness);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: font,
                    fontSize: 16,
                  ),
                ),
              ),
            )),
          );
        },
      ).toList(),
    );
  }

  Widget buildExercise(List<ex.Exercise> selected) {
    return GestureDetector(
      onHorizontalDragEnd: swipeFunction,
      child: Column(
        children: selected
            .map((e) => Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: AddExerciseCard(
                      exercise: e,
                      callback: () {
                        showCupertinoModalBottomSheet(
                            context: context,
                            expand: false,
                            builder: (context) =>
                                buildModal(exercise: e, context: context));
                      }),
                ))
            .toList(),
      ),
    );
  }

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = FitnessLevel.values.indexOf(selectedFitness);
    final hasNext = selectedIndex < FitnessLevel.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity < 0 && hasNext) {
        final nextFitness = FitnessLevel.values[selectedIndex + 1];
        selectedFitness = nextFitness;
      }
      if (dragEndDetails.primaryVelocity > 0 && hasPrevious) {
        final previousFitness = FitnessLevel.values[selectedIndex - 1];
        selectedFitness = previousFitness;
      }
    });
  }

  Widget buildSearch() => SizedBox(
        child: SearchWidget(
          query,
          searchExercise,
          'Search by exercise',
        ),
      );

  void searchExercise(String query) {
    // final filteredExercises = selectedExercises.where((exercise) {
    //   final perExercise = exercise.name.toLowerCase();
    //   final searchLower = query.toLowerCase();

    //   return perExercise.contains(searchLower);
    // }).toList();

    setState(() {
      this.query = query;
      // this.selectedExercises = filteredExercises;
    });
  }

  Widget buildModal({ex.Exercise exercise, BuildContext context}) {
    bool timed = exercise.isTimed;
    bool weighted = exercise.isWeighted;

    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Customise Your Exercise',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    NumberPicker(
                      itemHeight: 40,
                      value: selectedSets,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (value) =>
                          setState(() => selectedSets = value),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text('Sets'),
                  ]),
                ),
                !timed
                    ? Expanded(
                        flex: 1,
                        child: Column(children: [
                          NumberPicker(
                            itemHeight: 40,
                            value: selectedReps,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) => setState(() {
                              selectedReps = value;
                            }),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text('Reps'),
                        ]),
                      )
                    : Expanded(
                        flex: 1,
                        child: Column(children: [
                          NumberPicker(
                            itemHeight: 40,
                            value: selectedTime,
                            step: 5,
                            minValue: 0,
                            maxValue: 120,
                            onChanged: (value) =>
                                setState(() => selectedTime = value),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text('Time'),
                        ]),
                      ),
                weighted
                    ? Expanded(
                        flex: 1,
                        child: Column(children: [
                          NumberPicker(
                            itemHeight: 40,
                            value: selectedWeight,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) =>
                                setState(() => selectedWeight = value),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text('Weight'),
                        ]),
                      )
                    : SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  exercise.sets = selectedSets;
                  if (!timed) {
                    exercise.reps = selectedReps;
                  } else {
                    exercise.time = Duration(seconds: selectedTime);
                  }

                  if (weighted) {
                    exercise.weight = selectedWeight;
                  }
                  setState(() {
                    addedExercises.add(exercise);
                  });

                  print(addedExercises);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                child: Text('Add Exercise'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      ),
    );
  }

  Widget buildDialog({BuildContext context, Workout workout}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        TextButton(
          child: Text(
            'Confirm',
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () async {
            Map<String, Workout> tempMap = {controller.text: workout};
            await DatabaseService(uid: uid).addSavedWorkout([tempMap]);
            var nav = Navigator.of(context);
            FitnessLevel userFitness = await DatabaseService()
                .getFitnessLevel(uid)
                .then((value) => (Enums.enumFromString<FitnessLevel>(
                    value, FitnessLevel.values)));
            List<Map<String, Workout>> savedWorkouts =
                await DatabaseService(uid: uid).retrieveSavedWorkout();

            nav.pop();
            nav.pushReplacement(MaterialPageRoute(
                builder: (context) => DoWorkout(
                      userFitness: userFitness,
                      savedWorkouts: savedWorkouts,
                    )));

            // changed from pushReplacement, somehow pushReplacement goes to the wrong page
          },
        )
      ],
      title: Text('Name of Workout:'),
      content: Container(
        height: 42,
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: controller,
        ),
      ),
    );
  }
}
