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
        autoPlay: true,
        mute: true,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(
          'Exercise Demonstration',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(exercise.name + ' Demonstration',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
