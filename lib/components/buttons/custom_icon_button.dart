import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final Function onTap;

  const CustomIconButton ({Key key, this.onTap}) : super (key: key);

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
    return Container(
      height: 46,
      width: 46,
      child: Center(
        child: FloatingActionButton(
          onPressed: widget.onTap,
          child: Icon(
              Icons.playlist_add,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 240, 182, 28),
          elevation: 2,
        )
      ),
    );
  }
}
