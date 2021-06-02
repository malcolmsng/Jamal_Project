import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/authentication.dart';
// import 'package:jamal_v1/ui/demonstration.dart';
// import 'package:jamal_v1/ui/suggestedWorkouts.dart';
// import 'package:jamal_v1/ui/suggester.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/suggester': (context) => Suggester(),
      //   '/suggested': (context) => SuggestedWorkout(),
      //   '/demonstration': (context) => ExerciseDemonstration(),
      // },
      title: "jamal",
      home: Authentication(),
    );
  }
}
