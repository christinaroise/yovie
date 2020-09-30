import 'package:flutter/material.dart';

class Util {

  Util();

  Util.navigateToPage(StatefulWidget page, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}