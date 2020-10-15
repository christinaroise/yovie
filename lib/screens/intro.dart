import 'package:flutter/material.dart';
import 'package:yovie_app/components/buttons/custom_button.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/navigation.dart';
import 'package:yovie_app/theme/style.dart';
import 'package:yovie_app/utils/utils.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "WELCOME TO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                decorativeTitle(),
                Spacer(),
                Image(image: new AssetImage('assets/gifs/dwipada.gif')),
                Spacer(),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                    onTap: (){
                      Util.navigateToPage(Navigation(), context);
                    },
                    title: "GET STARTED",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Footnote(
                    title: "This is a demo app meant as an introduction to Flutter used in workshops for developers"
                  )
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}


Widget decorativeTitle(){
  return RichText(
    text: TextSpan(
      text: 'y',
      style: TextStyle(
          color: CustomTheme.yellowColor,
          fontSize: 80,
          fontWeight: FontWeight.bold
      ),
      children: <TextSpan>[
        TextSpan(
            text: 'o', style: TextStyle(color: Color.fromARGB(255, 176, 225, 227))),
        TextSpan(
            text: 'g',
            style: TextStyle(color: Color.fromARGB(255, 77, 100, 73))),
        TextSpan(
            text: 'i',
            style: TextStyle(color: CustomTheme.yellowColor)),
        TextSpan(
            text: 'e',
            style: TextStyle(color: Color.fromARGB(255, 213, 167, 121))),
      ],
    ),
  );
}