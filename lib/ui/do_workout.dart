import 'package:flutter/material.dart';

import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/ui/custom_exercises.dart';
import 'package:jamal_v1/ui/suggester.dart';
import 'package:jamal_v1/ui/testpage.dart';
import 'package:jamal_v1/ui/workout_plan.dart';
import 'package:jamal_v1/util/enum_methods.dart';
// import 'package:jamal_v1/widgets/features.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class DoWorkout extends StatefulWidget {
  @override
  _DoWorkoutState createState() => _DoWorkoutState();
}

class _DoWorkoutState extends State<DoWorkout> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      // bottomNavigationBar: BottomFeaturesBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/testbg2.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter)),
        width: screenSize.width,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Text(
              // insert user's name here
              "Add a workout",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Text("Choose an option below",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w400)),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            TextButton(
              child: Text("Recommend me a workout!"),
              onPressed: () async {
                FitnessLevel userFitness = await DatabaseService()
                    .getFitnessLevel(uid)
                    .then((value) => (Enums.enumFromString<FitnessLevel>(
                        value, FitnessLevel.values)));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // settings: RouteSettings(arguments: userFitness),
                      builder: (context) => Suggester(
                            userFitness: userFitness,
                          )),
                );
              },
            ),
            TextButton(
              child: Text('Add custom workout!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomExercisesPage(),
                  ),
                );
              },
            ),

            // TextButton(
            //   child: Text('Flask'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => FlaskTest(),
            //       ),
            //     );
            //   },
            // ),
            // TextButton(
            //   child: Text('Back to dashboard'),
            //   onPressed: () {
            //     print('Confirmed');
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ExerciseDemonstration(),
            //       ),
            //     );
            //   },
            // ),
            // TextButton(
            //   child: Text('Back to dashboard'),
            //   onPressed: () {
            //     print('Confirmed');
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => SuggestedWorkout(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
