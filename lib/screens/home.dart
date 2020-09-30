import 'package:flutter/material.dart';
import 'package:yovie_app/components/appbars/custom_appbar.dart';
import 'package:yovie_app/components/sliders/carousel.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/theme/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CustomAppbar(),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Hi buddy,"
                            ),
                            Text(
                                "Let's start your journey"
                            ),
                          ],
                        ),
                      ),
                    ),
                    Carousel(),
                    Footnote(
                      title: "this is a footnote"
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
