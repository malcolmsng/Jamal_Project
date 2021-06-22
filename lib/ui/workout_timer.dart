import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class WorkoutTimer extends StatefulWidget {
  @override
  _WorkoutTimerState createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  // double percent = 0;
  // static int minutes = 1;
  // int seconds = minutes * 60;

  // Timer timer;

  bool running = false;
  bool started = false;

  CountDownController _controller = CountDownController();
  int _duration = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
          child: CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: _duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery.of(context).size.width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery.of(context).size.height / 2,

        // Ring Color for Countdown Widget.
        ringColor: Colors.grey[300],

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: Colors.grey[400],

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        backgroundColor: Colors.blueAccent,

        // Background Gradient for Countdown Widget.
        backgroundGradient: null,

        // Border Thickness of the Countdown Ring.
        strokeWidth: 20.0,

        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,

        // Text Style for Countdown Text.
        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.S,

        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,

        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: true,

        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,

        // Handles the timer start.
        autoStart: false,

        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          print('Countdown Started');
        },

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          print('Countdown Ended');
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(
              title: running ? "Pause" : 'Start',
              onPressed: () {
                if (running == false && started == false) {
                  _controller.start();
                  setState(() {
                    started = true;
                    running = true;
                  });
                } else if (running == false && started == true) {
                  _controller.resume();
                  setState(() {
                    running = true;
                  });
                } else {
                  _controller.pause();
                  setState(() {
                    running = false;
                  });
                }
              }),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration))
        ],
      ),
    );
  }

  _button({@required String title, VoidCallback onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
    ));
  }
}

// _startTimer() {
//   minutes = 1;
//   int secPercent = seconds;
//   timer = Timer.periodic(Duration(seconds: 1), (timer) {
//     setState(() {
//       if (seconds > 0) {
//         seconds--;
//         percent += 1 / secPercent;
//         if (seconds % 60 == 0) {
//           minutes--;
//         }
//       } else {
//         percent = 0;
//         minutes = 1;
//         timer.cancel();
//       }
//     });
//   });
//   print('test');
// }

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//           colors: [Colors.blueAccent, Colors.lightBlueAccent],
//         )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: CircularPercentIndicator(
//                   header: Text('Time Remaining',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                       )),
//                   percent: percent,
//                   animation: true,
//                   animateFromLastPercent: true,
//                   radius: 250,
//                   lineWidth: 10,
//                   progressColor: Colors.white,
//                   center: Text(
//                     '$seconds',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                     ),
//                   )),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//                 child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30.0),
//                       topLeft: Radius.circular(30.0))),
//               child: Padding(
//                 padding: EdgeInsets.only(top: 30, left: 20, right: 20),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Column(
//                             children: [
//                               Text(
//                                 'Work',
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 '60',
//                                 style: TextStyle(
//                                   fontSize: 80,
//                                 ),
//                               )
//                             ],
//                           )),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Rest',
//                                   style: TextStyle(
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   '5',
//                                   style: TextStyle(
//                                     fontSize: 80,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                         onPressed: () {
//                           _startTimer();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100)),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: Text(
//                             'Start Workout',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                             ),
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//             )),
//           ],
//         ),
//       ),
//     ),
//   );
// }
