import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/provider/workout_provider.dart';
import 'package:jamal_v1/widgets/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:jamal_v1/model/workout.dart';

// List<Appointment> getAppointments() {
//   List<Appointment> workouts = <Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 0, 0, 0);
//   final DateTime endTime = startTime.add(Duration(hours: 23, minutes: 59));

//   workouts
//       .add(Appointment(startTime: startTime, endTime: endTime, isAllDay: true));
//   return workouts;
// }

class WorkoutDataSource extends CalendarDataSource {
  List<Appointment> workouts;
  WorkoutDataSource({this.workouts});

  Workout getWorkout(int index) {
    workouts[index] as Workout;
  }

  @override
  DateTime getStartTime(int index) => getWorkout(index).date;

  @override
  DateTime getEndTime(int index) => getWorkout(index).date;

  @override
  String getSubject(int index) => getWorkout(index).toString();

  @override
  bool isAllDay(int index) => true;
}
