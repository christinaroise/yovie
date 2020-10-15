import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:yovie_app/theme/style.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FAProgressBar(
          currentValue: 0,
          borderRadius: 100,
          size: 7,
          backgroundColor: Colors.grey[200],
          progressColor: CustomTheme.buttonColor,
          animatedDuration: Duration(seconds: 30),
        )
    );
  }
}
