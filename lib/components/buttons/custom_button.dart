import 'package:flutter/material.dart';
import 'package:yovie_app/theme/style.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButton ( {Key key,
    this.title,
    this.onTap
  } ) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
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
    return RaisedButton(
      elevation: 2,
      textColor: Colors.white,
      onPressed: widget.onTap,
      color: CustomTheme.buttonColor,
      splashColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
