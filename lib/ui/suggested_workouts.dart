import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/ui/demonstration.dart';
import 'package:jamal_v1/ui/workout_timer.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';

import 'home_page.dart';

class SuggestedWorkout extends StatefulWidget {
  @override
  _SuggestedWorkoutState createState() => _SuggestedWorkoutState();
}

class _SuggestedWorkoutState extends State<SuggestedWorkout> {
  //find a way to retrieve user id
  String uid = 'QxZTmkv4oHfR1dK4ya1yWH7A2I22';

  List<ex.Exercise> exercises;

  Equipment noEquip;

  void initState() {
    exercises = [
      pushup,
      situp,
      jumpSquat,
      toeTouches,
    ];

    super.initState();
  }

  Future<void> finishedWorkoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Workout completed!'),
          actions: <Widget>[
            TextButton(
              child: Text('Back to dashboard'),
              onPressed: () {
                print('Confirmed');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
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
                  ex.Exercise current = exercises[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      print(current.focus[0]);
                      Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(arguments: current),
                        builder: (context) => ExerciseDemonstration(),
                      )
                          //
                          );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: queryData.size.height / 5,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                        color: ex.getColour(current.focus[0]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.values.first,
                        children: [
                          Text(
                            '${current.name}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            (current.reps == null
                                ? '${current.sets} sets x ${current.time} seconds'
                                : '${current.sets} sets x ${current.reps} reps'),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                child: Text('End Workout'),
                onPressed: () async {
                  finishedWorkoutDialog();
                  await DatabaseService(uid: uid).addWorkout("pushup");
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
