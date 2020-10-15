import 'package:flutter/material.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/theme/style.dart';

class NoPoseInPlayList extends StatefulWidget {
  @override
  _NoPoseInPlayListState createState() => _NoPoseInPlayListState();
}

class _NoPoseInPlayListState extends State<NoPoseInPlayList> with SingleTickerProviderStateMixin {
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
    return Stack(
      children: [
        Center(
          child: Icon(
            Icons.play_arrow,
            size: 200,
            color: CustomTheme.fadedPrimaryColor,
          ),
        ),
        Footnote(
          title: "Find poses to add to your playlist",
        )
      ],
    );
  }
}
