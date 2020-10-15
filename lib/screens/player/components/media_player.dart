import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class MediaPlayer extends StatefulWidget {
  final Function onTapPrevious;
  final Function onTapPlayPause;
  final Function onTapNext;

  const MediaPlayer(
      {Key key, this.onTapPrevious, this.onTapPlayPause, this.onTapNext})
      : super(key: key);

  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  IconData playPause = Icons.play_arrow;
  int counterSeconds = 0;
  int counterMinutes = 0;
  String counterSecondsToString = "00";
  String counterMinutesToString = "00";
  Timer timerSeconds;
  Timer timerMinutes;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    //stopTimer();
  }

  startTimer() {
    timerSeconds = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        counterSeconds++;
      });

      if(counterSeconds == 60){
        setState(() {
          counterSeconds = 0;
        });
      }

      if (counterSeconds < 60) {
        if (counterSeconds > 9) {
          setState(() {
            counterSecondsToString = counterSeconds.toString();
          });
        } else {
          setState(() {
            counterSecondsToString = "0" + counterSeconds.toString();
          });
        }
      }
    });

    timerMinutes = new Timer.periodic(new Duration(minutes: 1), (timer) {
      setState(() {
        counterMinutes++;
      });
      if (counterMinutes > 9) {
        setState(() {
          counterMinutesToString = counterMinutes.toString();
        });
      } else {
        setState(() {
          counterMinutesToString = "0" + counterMinutes.toString();
      });
      }
    });
  }

  stopTimer() {
    timerSeconds.cancel();
    timerMinutes.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          counterMinutesToString + ":" + counterSecondsToString,
          style: TextStyle(
              color: CustomTheme.darkBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                customIcon(Icons.skip_previous, widget.onTapPrevious),
                customIcon(playPause, () {
                  if (playPause == Icons.play_arrow) {
                    startTimer();
                    setState(() {
                      playPause = Icons.pause;
                    });
                  } else {
                    stopTimer();
                    setState(() {
                      playPause = Icons.play_arrow;
                    });
                  }
                  return widget.onTapPlayPause();
                }),
                customIcon(Icons.skip_next, widget.onTapNext),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Widget customIcon(icon, onPressed) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: IconButton(
      icon: Icon(icon),
      iconSize: 34,
      onPressed: onPressed,
    ),
  );
}
