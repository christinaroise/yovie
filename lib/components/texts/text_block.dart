import 'package:flutter/material.dart';
import 'package:yovie_app/components/texts/h3_title.dart';
import 'package:yovie_app/components/texts/paragraph.dart';

class TextBlock extends StatefulWidget {
  final String title;
  final String paragraph;

  const TextBlock ({Key key,
    this.title,
    this.paragraph
  }) : super (key:key);

  @override
  _TextBlockState createState() => _TextBlockState();
}

class _TextBlockState extends State<TextBlock> with SingleTickerProviderStateMixin {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: H3Title(
              title: widget.title
            )
          ),
          Paragraph(
            text: widget.paragraph,
          )
        ],
      ),
    );
  }
}
