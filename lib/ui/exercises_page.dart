import 'package:flutter/material.dart';
import 'package:jamal_v1/util/advanced_exercise_constants.dart';
import 'package:jamal_v1/util/beginner_exercise_constants.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/widgets/exercise_card.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/widgets/search_exercises.dart';
import 'package:jamal_v1/util/enum_methods.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  FitnessLevel selectedFitness = FitnessLevel.Beginner;
  String query = '';
  List<ex.Exercise> selectedExercises = beginnerExercises;

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
                  child: ExerciseCard(
                    exercise: e,
                  ),
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
}
