import 'package:flutter/material.dart';
import 'package:yovie_app/screens/intro.dart';
import 'package:yovie_app/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        accentColor: CustomTheme.yellowColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Intro(),
    );
  }
}
