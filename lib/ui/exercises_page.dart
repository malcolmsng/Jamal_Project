import 'package:flutter/material.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/widgets/exercise_card.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  FitnessLevel selectedFitness = FitnessLevel.Beginner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 8,
            ),
            Text(
              'Exercises',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildFitnessLevels(context),
            SizedBox(
              height: 8,
            ),
            buildExercise(),
          ])),
        ),
        //ExerciseCard(exercise: pushup)
      ]),
    );
  }

  Widget buildFitnessLevels(context) {
    return Row(
      children: FitnessLevel.values.map(
        (fitness) {
          String name = enumToString(fitness);
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

  Widget buildExercise() {
    return GestureDetector(
      onHorizontalDragEnd: swipeFunction,
      child: Column(
        children:
            intermediate //should put every exercise in a list and pass it here
                .where((element) => element.difficulty == selectedFitness)
                .map((e) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
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
}
