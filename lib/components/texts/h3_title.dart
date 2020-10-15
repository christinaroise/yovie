import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class H3Title extends StatefulWidget {
  final String title;

  const H3Title ({Key key,
    this.title,
  }) : super (key:key);

  @override
  _H3TitleState createState() => _H3TitleState();
}

class _H3TitleState extends State<H3Title> with SingleTickerProviderStateMixin {
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
          fontSize: 16,
      ),
    );
  }
}
