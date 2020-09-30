import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class CustomIconButton extends StatefulWidget {
  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> with SingleTickerProviderStateMixin {
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
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color.fromARGB(255, 240, 182, 28),
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.playlist_add),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
