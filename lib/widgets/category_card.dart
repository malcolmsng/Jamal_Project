import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/ui/suggested_workouts.dart';
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:jamal_v1/ui/do_workout.dart';
import 'package:async/async.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Workout workout;
  final Function press;

  const CategoryCard({
    Key key,
    this.title,
    this.workout,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Exercise> exercises = workout.exercises;
    String uid = FirebaseAuth.instance.currentUser.uid;

    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SuggestedWorkout(
                  workout: workout,
                ),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              title,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              color: Colors.grey,
                              iconSize: 20,
                              padding: EdgeInsets.all(1),
                              alignment: Alignment.topRight,
                              onPressed: () async {
                                FitnessLevel userFitness =
                                    await DatabaseService()
                                        .getFitnessLevel(uid)
                                        .then((value) =>
                                            (Enums.enumFromString<FitnessLevel>(
                                                value, FitnessLevel.values)));
                                await DatabaseService(uid: uid)
                                    .deleteSavedWorkout(title);

                                List<Map<String, Workout>> savedWorkouts =
                                    await DatabaseService(uid: uid)
                                        .retrieveSavedWorkout();
                                Timer(Duration(milliseconds: 5), () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => DoWorkout(
                                      savedWorkouts: savedWorkouts,
                                      userFitness: userFitness,
                                    ),
                                  ));
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                      flex: 7,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          Exercise current = exercises[index];

                          String tempString = current.isWeighted
                              ? ' ' +
                                  current.sets.toString() +
                                  ' X ' +
                                  current.reps.toString() +
                                  ' X ' +
                                  current.weight.toString()
                              : current.name +
                                  ' ' +
                                  current.sets.toString() +
                                  ' X ' +
                                  current.reps.toString();
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: Text(
                              tempString,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                            ),
                          );
                        },
                        itemCount: exercises.length,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
