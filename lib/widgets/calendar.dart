
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      firstDayOfWeek: 1,
      cellBorderColor: Colors.transparent,
      dataSource: WorkoutDataSource(getAppointments()),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> workouts = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 0, 0, 0);
  final DateTime endTime = startTime.add(Duration(hours: 23, minutes: 59));

  workouts
      .add(Appointment(startTime: startTime, endTime: endTime, isAllDay: true));
  return workouts;
}

class WorkoutDataSource extends CalendarDataSource {
  WorkoutDataSource(List<Appointment> source) {
    appointments = source;
  }
}

