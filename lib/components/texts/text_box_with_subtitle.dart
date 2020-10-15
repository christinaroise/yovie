import 'package:flutter/material.dart';
import 'package:yovie_app/components/texts/h3_title.dart';
import 'package:yovie_app/components/texts/paragraph.dart';

class TextBoxWithSubtitle extends StatefulWidget {
  final String title;
  final String text;

  const TextBoxWithSubtitle ({Key key, this.title, this.text}) : super (key: key);
  @override
  _TextBoxWithSubtitleState createState() => _TextBoxWithSubtitleState();
}

class _TextBoxWithSubtitleState extends State<TextBoxWithSubtitle> with SingleTickerProviderStateMixin {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H3Title(
            title: widget.title
        ),
        Text(
          "30 seconds",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              height: 1.5
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Paragraph(
            text: widget.text
          ),
        ),
      ],
    );
  }
}
