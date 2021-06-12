import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/demonstration.dart';
import 'package:jamal_v1/ui/workout_timer.dart';
import 'package:jamal_v1/model/exercise.dart';
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';

class SuggestedWorkout extends StatefulWidget {
  @override
  _SuggestedWorkoutState createState() => _SuggestedWorkoutState();
}

class _SuggestedWorkoutState extends State<SuggestedWorkout> {
  List<Exercise> exercises;

  Equipment noEquip;

  void initState() {
    exercises = [
      pushup,
      situp,
      squat,
      plank,
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
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(children: [
                      Ink.image(
                        image: NetworkImage(current.picURL),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: current),
                                builder: (context) => ExerciseDemonstration(),
                              ),
                            );
                          },
                        ),
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          Text(
                            '${current.name}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 160,
                          ),
                          Text(
                            (current.reps == null
                                ? '${current.sets} sets x ${current.time} seconds'
                                : '${current.sets} sets x ${current.reps} reps'),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ]),
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
