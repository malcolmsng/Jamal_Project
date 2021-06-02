import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDemonstration extends StatefulWidget {
  @override
  _ExerciseDemonstrationState createState() => _ExerciseDemonstrationState();
}

class _ExerciseDemonstrationState extends State<ExerciseDemonstration> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=IODxDxX7oi4&t=2s&ab_channel=Calisthenicmovement'),
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
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
            Text('Pushup Demonstration',
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
