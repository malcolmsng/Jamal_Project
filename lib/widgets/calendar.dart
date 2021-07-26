import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/model/workout_datasource.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  List<Workout> monthlyWorkout;
  Calendar({Key key, this.monthlyWorkout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        child: Image.asset("assets/bg.jpg"),
      ),
      SfCalendar(
        onTap: (calendarTapDetails) {
          DateTime tempDate = calendarTapDetails.date;

          List<Workout> tempList = calendarTapDetails.appointments.isEmpty
              ? []
              : List<Workout>.from(calendarTapDetails.appointments);

          showCupertinoModalBottomSheet(
              context: context,
              expand: false,
              builder: (context) => buildModal(tempList, tempDate, context));
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
      ),
    ]);
  }

  Widget buildCell(
      BuildContext context, DateTime date, List<Workout> workout, Rect bounds) {
    if (workout.isNotEmpty && date.day != DateTime.now().day) {
      List<ex.Exercise> tempExercises = workout[0].exercises;

      List<String> workoutName =
          tempExercises.map((e) => Enums.enumToString(e.focus[0])).toList();
      print(bounds.height);
      return Container(
        height: bounds.height,
        child: Column(children: [
          Container(
            height: bounds.height * 1.4 / 8,
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
            height: bounds.height * 0.1 / 8,
          ),
          Container(
              height: bounds.height * 6.5 / 8,
              child: ListView.builder(
                  itemCount: workoutName.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(1),
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
            height: bounds.height * 1.4 / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.transparent),
                        color: Colors.lightBlue[200]),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: bounds.height * 0.1 / 8,
          ),
          Container(
              height: bounds.height * 6.5 / 8,
              child: ListView.builder(
                  itemCount: workoutName.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(1),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(flex: 4, child: SizedBox())
          ],
        ),
      );
    }
  }

  Widget buildModal(
      List<Workout> workout, DateTime date, BuildContext context) {
    List<ex.Exercise> exercises = workout.isEmpty ? [] : workout[0].exercises;
    String dayName = DateFormat('EEE').format(date);
    int day = date.day;

    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      dayName,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                          fontSize: 16),
                    ),
                  ),
                  day == DateTime.now().day
                      ? Container(
                          height: 30,
                          width: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              '$day',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                              color: Colors.lightBlue[200]),
                        )
                      : Container(
                          height: 30,
                          width: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              '$day',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                        )
                ],
              ),
            ),
            Expanded(
                flex: 13,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  child: exercises.length == 0
                      ? Center(
                          child: Text('No workout scheduled today'),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            ex.Exercise current = exercises[index];
                            Text subtitle = current.isTimed
                                ? Text('${current.sets} X ${current.time}')
                                : Text('${current.sets} X ${current.reps}');
                            return ListTile(
                              title: Text('${current.name}'),
                              subtitle: subtitle,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1,
                              color: Colors.blueAccent,
                            );
                          },
                          itemCount: exercises.length),
                ))
          ])),
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
