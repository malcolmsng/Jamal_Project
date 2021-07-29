import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:jamal_v1/model/workout.dart';

class WorkoutDataSource extends CalendarDataSource {
  WorkoutDataSource(List<Workout> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments[index].date;

  @override
  DateTime getEndTime(int index) => appointments[index].date;

  @override
  String getSubject(int index) => appointments[index].toString();

  @override
  bool isAllDay(int index) => true;
}
