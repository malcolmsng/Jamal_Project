import 'package:flutter/material.dart';
import 'package:jamal_v1/model/exercise.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDemonstration extends StatefulWidget {
  @override
  _ExerciseDemonstrationState createState() => _ExerciseDemonstrationState();
}

class _ExerciseDemonstrationState extends State<ExerciseDemonstration> {
  @override
  Widget build(BuildContext context) {
    final exercise = ModalRoute.of(context).settings.arguments as Exercise;

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(exercise.vidURL),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(exercise.name + ' Demonstration',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                )),
            Container(
                height: 400,
                child: YoutubePlayer(
                  controller: _controller,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                )),
            SizedBox(height: 30),
            Text(
                "1. Get down on all fours, placing your hands slightly wider than your shoulders. \n 2. Straighten your arms and legs. \n 3. Lower your body until your chest nearly touches the floor. "),
          ],
        ),
      ),
    );
  }
}
