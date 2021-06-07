import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StartWorkout extends StatefulWidget {
  @override
  _StartWorkoutState createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  double percent = 0;
  static int minutes = 1;
  int seconds = minutes * 60;

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
              Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text('dab',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ))),
              Expanded(
                child: CircularPercentIndicator(
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
                            topLeft: Radius.circular(30.0)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
