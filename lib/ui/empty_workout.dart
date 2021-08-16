import 'package:flutter/material.dart';

class EmptyWorkout extends StatelessWidget {
  const EmptyWorkout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'No Workout Scheduled Today',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
