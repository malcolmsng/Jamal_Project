import 'package:flutter/material.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/ui/suggested_workouts.dart';
import 'package:jamal_v1/ui/testpage.dart';
import 'package:jamal_v1/widgets/calendar.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key key}) : super(key: key);

  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    List<Workout> monthlyWorkout = ModalRoute.of(context).settings.arguments;
    Workout currentWorkout = monthlyWorkout
        .where((workout) => workout.date.day == DateTime.now().day)
        .toList()[0];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => (SuggestedWorkout(
                    workout: currentWorkout,
                  )))))),
      appBar: AppBar(),
      body: Calendar(
        monthlyWorkout: monthlyWorkout,
      ),
    );
  }
}
