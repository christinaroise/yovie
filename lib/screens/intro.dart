import 'package:flutter/material.dart';
import 'package:yovie_app/components/buttons/custom_button.dart';
import 'package:yovie_app/theme/style.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("IMAGE HERE"),
              CustomButton(
                onTap: (){},
                title: "ENTER",
              )
            ],
          )
        ),
      ),
    );
  }
}
