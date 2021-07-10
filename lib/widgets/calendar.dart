import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/model/workout_datasource.dart';

class Calendar extends StatelessWidget {
  List<Workout> monthlyWorkout;
  Calendar({Key key, this.monthlyWorkout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      firstDayOfWeek: 1,
      cellBorderColor: Colors.transparent,
      dataSource: WorkoutDataSource(monthlyWorkout),
    );
  }
}

List<Appointment> getAppointments(List<Workout> work) {
  List<Appointment> workouts = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 0, 0, 0);
  final DateTime endTime = startTime.add(Duration(hours: 23, minutes: 59));

  workouts
      .add(Appointment(startTime: startTime, endTime: endTime, isAllDay: true));
  return workouts;
}
