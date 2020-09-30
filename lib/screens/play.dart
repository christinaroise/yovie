import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: Container(
        child: Text("TEST"),
      ),
    );
  }
}
