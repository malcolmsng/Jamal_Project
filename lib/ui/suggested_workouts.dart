import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/demonstration.dart';
import 'package:jamal_v1/widgets/equipment_checkbox.dart';
import 'package:jamal_v1/widgets/fitness_checkbox.dart';
import 'package:jamal_v1/ui/startWorkout.dart';

class Exercise {
  FitnessLevel difficulty;
  Equipment equipmentNeeded;
  String name;
  int reps;
  int sets;
  int timeInSeconds;

  Exercise(
      {this.difficulty,
      this.equipmentNeeded,
      this.name,
      this.sets = 1,
      this.reps,
      this.timeInSeconds});
}

class SuggestedWorkout extends StatefulWidget {
  @override
  _SuggestedWorkoutState createState() => _SuggestedWorkoutState();
}

class _SuggestedWorkoutState extends State<SuggestedWorkout> {
  FitnessLevel beginner;
  FitnessLevel intermediate;
  FitnessLevel advanced;

  List<Exercise> exercises;

  Equipment noEquip;

  void initState() {
    beginner = FitnessLevel(id: 1, level: 'Beginner');
    intermediate = FitnessLevel(id: 2, level: 'Intermediate');
    advanced = FitnessLevel(id: 3, level: 'Advanced');
    noEquip = Equipment(id: 1, name: 'No equipment');
    exercises = [
      Exercise(
          difficulty: beginner,
          equipmentNeeded: noEquip,
          name: 'Pushups',
          sets: 4,
          reps: 15),
      Exercise(
          difficulty: beginner,
          equipmentNeeded: noEquip,
          name: 'Situps',
          sets: 4,
          reps: 15),
      Exercise(
          difficulty: beginner,
          equipmentNeeded: noEquip,
          name: 'Squats',
          sets: 4,
          reps: 15),
      Exercise(
          difficulty: beginner,
          equipmentNeeded: noEquip,
          name: 'Planks',
          timeInSeconds: 30)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Suggested Workout'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  Exercise current = exercises[index];
                  return InkWell(
                    onTap: () {
                      print('Confirmed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDemonstration(),
                        ),
                      );
                    },
                    child: Card(
                        child: Column(
                      children: [
                        Text(
                          '${current.name}',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          (current.reps == null
                              ? '${current.sets} sets x ${current.timeInSeconds} seconds'
                              : '${current.sets} sets x ${current.reps} reps'),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    )),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              child: Text('Start Workout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutTimer(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
