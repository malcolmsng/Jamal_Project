import 'package:flutter/material.dart';
import 'package:jamal_v1/provider/workout_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:jamal_v1/model/workout_datasource.dart';
import 'package:jamal_v1/model/workout.dart';

class Calendar extends StatelessWidget {
  final List<Appointment> workouts;
  const Calendar({Key key, this.workouts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      firstDayOfWeek: 1,
      cellBorderColor: Colors.transparent,
      dataSource: WorkoutDataSource(workouts: workouts),
    );
  }
}
