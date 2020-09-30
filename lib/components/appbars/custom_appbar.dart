import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class CustomAppbar extends StatefulWidget {
  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> with SingleTickerProviderStateMixin {
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
    return AppBar(
      actionsIconTheme: IconThemeData(
          color: Colors.black87,
      ),
      title: Text(
          "yogie.",
        style: TextStyle(
          color: Colors.black87
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: CustomTheme.whiteColor,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.more_vert,
                  size: 20,
                ),
              ),
            )
        ),
      ],
    );
  }
}
