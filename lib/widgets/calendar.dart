import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:jamal_v1/widgets/custom_agenda.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/model/workout_datasource.dart';

class Calendar extends StatelessWidget {
  List<Workout> monthlyWorkout;
  Calendar({Key key, this.monthlyWorkout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      onTap: (calendarTapDetails) {
        List<Workout> tempList =
            List<Workout>.from(calendarTapDetails.appointments);

        showModalBottomSheet(
            context: context,
            builder: (context) => CustomAgenda(selectedWorkout: tempList));
      },
      view: CalendarView.month,
      showDatePickerButton: true,
      monthCellBuilder: (context, details) {
        List<Workout> tempList = List<Workout>.from(details.appointments);

        return buildCell(context, details.date, tempList, details.bounds);
      },
      monthViewSettings: MonthViewSettings(
          agendaStyle: AgendaStyle(
              backgroundColor: Color(0xFF355C7D),
              appointmentTextStyle: TextStyle(fontSize: 16),
              dayTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              dateTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              )),
          dayFormat: 'EEE',
          agendaItemHeight: MediaQuery.of(context).size.height * 0.10,
          agendaViewHeight: MediaQuery.of(context).size.height * 0.25,
          showTrailingAndLeadingDates: false,
          showAgenda: false,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      initialSelectedDate: DateTime.now(),
      firstDayOfWeek: 1,
      cellBorderColor: Colors.lightGreen,
      dataSource: WorkoutDataSource(monthlyWorkout),
    );
  }

  Widget buildCell(
      BuildContext context, DateTime date, List<Workout> workout, Rect bounds) {
    if (workout.isNotEmpty && date.day != DateTime.now().day) {
      List<ex.Exercise> tempExercises = workout[0].exercises;
      List<String> workoutName =
          tempExercises.map((e) => Enums.enumToString(e.focus[0])).toList();

      return Container(
        height: bounds.height,
        child: Column(children: [
          Container(
            height: bounds.height * 1.5 / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.day.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: bounds.height * 0.5 / 8,
          ),
          Container(
              height: bounds.height * 6 / 8,
              child: ListView.builder(
                  itemCount: workoutName.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(0.5),
                      height: bounds.height * 1 / 7,
                      child: Text(
                        '${workoutName[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.blueAccent),
                    );
                  }))
        ]),
      );
    } else if (date.day == DateTime.now().day && workout.isNotEmpty) {
      List<ex.Exercise> tempExercises = workout[0].exercises;
      List<String> workoutName =
          tempExercises.map((e) => Enums.enumToString(e.focus[0])).toList();

      return Container(
        height: bounds.height,
        child: Column(children: [
          Container(
            height: bounds.height * 2 / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 23,
                  width: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.transparent),
                      color: Colors.lightBlueAccent),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: bounds.height * 6 / 8,
              child: ListView.builder(
                  itemCount: workoutName.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(0.5),
                      height: bounds.height * 1 / 7,
                      child: Text(
                        '${workoutName[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.blueAccent),
                    );
                  }))
        ]),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(flex: 3, child: SizedBox())
          ],
        ),
      );
    }
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
