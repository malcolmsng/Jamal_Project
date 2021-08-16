import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/ui/demonstration.dart';
import 'package:jamal_v1/ui/workout_timer.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'dart:math';
import 'home_page.dart';

class SuggestedWorkout extends StatefulWidget {
  Workout workout;

  SuggestedWorkout({Key key, this.workout}) : super(key: key);

  @override
  _SuggestedWorkoutState createState() => _SuggestedWorkoutState();
}

class _SuggestedWorkoutState extends State<SuggestedWorkout> {
  List<List<String>> listOfListOfWorkouts = [
    ["pushup", "4", "20", "10"],
    ["situp", "4", "15", "0"]
  ];
  String uid = FirebaseAuth.instance.currentUser.uid;
  bool isRest = false;
  List restOrWork;
  List<ex.Exercise> exercises;
  @override
  void initState() {
    restOrWork = widget.workout.exercises.map((e) => false).toList();
    exercises = widget.workout.exercises;
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  ex.Exercise current = exercises[index];

                  int currentSet = current.sets;

                  int currentRep = current.reps;
                  int currentTime =
                      current.time != null ? current.time.inSeconds : 0;

                  return restOrWork[index]
                      ? InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            setState(() {
                              restOrWork[index] = !restOrWork[index];
                            });
                          },
                          onLongPress: () {
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
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.values.first,
                                    children: [
                                      Text(
                                        '${current.name}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (currentRep == 0
                                            ? '$currentSet sets x $currentTime seconds'
                                            : '$currentSet sets x $currentRep reps'),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: buildTimer(
                                        widget.workout.rest, current.picURL,
                                        () {
                                      setState(() {
                                        restOrWork[index] = !restOrWork[index];
                                        exercises[index].sets -= 1;
                                      });
                                    })),

                                // backgroundImage: NetworkImage(current.picURL),
                              ],
                            ),
                          ),
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            setState(() {
                              restOrWork[index] = !restOrWork[index];
                            });
                          },
                          onLongPress: () {
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
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.values.first,
                                    children: [
                                      Text(
                                        '${current.name}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (currentRep == 0
                                            ? '$currentSet sets x $currentTime seconds'
                                            : '$currentSet sets x $currentRep reps'),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          NetworkImage(current.picURL),
                                    )

                                    // backgroundImage: NetworkImage(current.picURL),
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
                child: Text('End Workout'),
                onPressed: () async {
                  finishedWorkoutDialog();
                  await DatabaseService(uid: uid).addWorkoutListWithDate(
                      "2021-08-21", listOfListOfWorkouts, 100);
                },
              ),
            ])
          ],
        ),
      ),
    );
  }

  Widget buildTimer(Duration time, String imageUrl, [VoidCallback callBack]) {
    print('buildTimer');
    return TweenAnimationBuilder(
      onEnd: callBack,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: time.inSeconds),
      builder: (context, value, child) {
        int percentage = (value * 100).ceil();
        return Container(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                        startAngle: 0.0,
                        endAngle: 2 * pi,
                        stops: [value, value],
                        // 0.0 , 0.5 , 0.5 , 1.0
                        center: Alignment.center,
                        colors: [
                          Colors.white.withAlpha(200),
                          Colors.transparent,
                        ]).createShader(rect);
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(imageUrl),
                  )
                  // child: Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(image: NetworkImage(imageUrl))),
                  // ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
