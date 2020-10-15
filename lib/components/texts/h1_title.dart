import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';


class H1Title extends StatefulWidget {
  final String title;
  final bool centered;

  const H1Title({Key key,
    this.title,
    this.centered
  }) : super(key: key);

  @override
  _H1TitleState createState() => _H1TitleState();
}

class _H1TitleState extends State<H1Title> with SingleTickerProviderStateMixin {
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
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: CustomTheme.yellowColor,
      ),
      textAlign: (widget.centered == true)
          ? TextAlign.center
          : TextAlign.start,
    );
  }
}