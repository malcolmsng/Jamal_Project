import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class WorkoutTimer extends StatefulWidget {
  @override
  _WorkoutTimerState createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  double percent = 0;
  static int minutes = 1;
  int seconds = minutes * 60;

  Timer timer;

  _startTimer() {
    minutes = 1;
    int secPercent = seconds;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
          percent += 1 / secPercent;
          if (seconds % 60 == 0) {
            minutes--;
          }
        } else {
          percent = 0;
          minutes = 1;
          timer.cancel();
        }
      });
    });
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CircularPercentIndicator(
                    header: Text('Time Remaining',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 250,
                    lineWidth: 10,
                    progressColor: Colors.white,
                    center: Text(
                      '$seconds',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Work',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '60',
                                  style: TextStyle(
                                    fontSize: 80,
                                  ),
                                )
                              ],
                            )),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Rest',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 80,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _startTimer();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Start Workout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
