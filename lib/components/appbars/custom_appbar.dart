import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class CustomAppbar extends StatefulWidget {
  final String title;

  const CustomAppbar ({Key key, this.title}) : super (key: key);

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
        widget.title,
        style: TextStyle(
          color: CustomTheme.darkBlueColor,
          fontWeight: FontWeight.bold
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
