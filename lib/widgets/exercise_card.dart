import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/ui/demonstration.dart';

class ExerciseCard extends StatefulWidget {
  final ex.Exercise exercise;
  const ExerciseCard({Key key, this.exercise}) : super(key: key);

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          // changed from pushReplacement, somehow pushReplacement goes to the wrong page
          MaterialPageRoute(
              builder: (context) => ExerciseDemonstration(),
              settings: RouteSettings(arguments: widget.exercise)),
        );
      },
      child: InkWell(
        hoverColor: Colors.black,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: getColour(),
          ),
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: buildText(),
                flex: 3,
              ),
              Expanded(child: Image.network(widget.exercise.picURL)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    //widget is referring to the ExerciseCard class
    //since i placed the exercise property there
    String name = widget.exercise.name;
    String focuses =
        widget.exercise.focus.map((e) => enumToString(e)).join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Focus: ' + focuses,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Color getColour() {
    switch (widget.exercise.focus[0]) {
      case ex.Focus.Chest:
        return Color(0xffffcdd2);
        break;
      case ex.Focus.Back:
        return Color(0xffe1bee7);
        break;
      case ex.Focus.Legs:
        return Color(0xffb3e5fc);
        break;
      case ex.Focus.Bicep:
        return Color(0xffb2dfdb);
        break;
      case ex.Focus.Tricep:
        return Color(0xfffff9c4);
        break;
      case ex.Focus.Abs:
        return Color(0xffffe0b2);
        break;
      case ex.Focus.Cardio:
        return Color(0xffd7ccc8);
        break;
    }
  }
}
