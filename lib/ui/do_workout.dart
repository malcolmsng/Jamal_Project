import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/demonstration.dart';
import 'package:jamal_v1/ui/suggester.dart';
import 'package:jamal_v1/widgets/features.dart';

class DoWorkout extends StatefulWidget {
  @override
  _DoWorkoutState createState() => _DoWorkoutState();
}

class _DoWorkoutState extends State<DoWorkout> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomFeaturesBar(),
      body: Stack(children: [
        SizedBox(
          child: Image.asset("assets/bg.jpg"),
        ),
        Container(
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
              Text("Choose an option below"),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              TextButton(
                child: Text("Recommend me a workout!"),
                onPressed: () {
                  print('Confirmed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Suggester(),
                    ),
                  );
                },
              ),
              TextButton(
                child: Text('Add custom workout!'),
                onPressed: () {},
              ),
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
      ]),
    );
  }
}
