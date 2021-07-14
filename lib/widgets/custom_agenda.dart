import 'package:flutter/material.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/model/workout_datasource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomAgenda extends StatefulWidget {
  List<Workout> selectedWorkout;
  CustomAgenda({Key key, this.selectedWorkout}) : super(key: key);

  @override
  _CustomAgendaState createState() => _CustomAgendaState();
}

class _CustomAgendaState extends State<CustomAgenda> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      dataSource: WorkoutDataSource(widget.selectedWorkout),
      view: CalendarView.day,
    );
  }
}
