import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';


class Paragraph extends StatefulWidget {
  final String text;
  final double height;

  const Paragraph ({Key key,
    this.text,
    this.height
  }) : super (key:key);

  @override
  _ParagraphState createState() => _ParagraphState();
}

class _ParagraphState extends State<Paragraph> with SingleTickerProviderStateMixin {
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
      widget.text,
      style: TextStyle(
        color: CustomTheme.darkBlueColor,
        height: (widget.height != null)
            ? widget.height
            : 1.3,
      ),
    );
  }
}
