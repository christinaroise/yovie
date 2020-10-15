import 'package:flutter/material.dart';

class Footnote extends StatefulWidget {
  final String title;

  const Footnote({Key key, this.title}) : super(key: key);

  @override
  _FootnoteState createState() => _FootnoteState();
}

class _FootnoteState extends State<Footnote> with SingleTickerProviderStateMixin {
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
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
