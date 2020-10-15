import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class H2Title extends StatefulWidget {
  final String title;

  const H2Title ({Key key,
    this.title,
  }) : super (key:key);

  @override
  _H2TitleState createState() => _H2TitleState();
}

class _H2TitleState extends State<H2Title> with SingleTickerProviderStateMixin {
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
    return Text(
      widget.title,
      style: TextStyle(
          color: CustomTheme.darkBlueColor,
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
    );
  }
}
