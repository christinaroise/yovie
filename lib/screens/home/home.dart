import 'package:flutter/material.dart';
import 'package:yovie_app/components/texts/h2_title.dart';
import 'package:yovie_app/components/texts/paragraph.dart';
import 'package:yovie_app/screens/home/components/carousel.dart';
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
      backgroundColor: CustomTheme.primaryColor,
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            H2Title(
                              title: "Hi Sunshine,"
                            ),
                            Paragraph(
                              text: "Let's dive into your yoga experience"
                            )
                          ],
                        ),
                      ),
                    ),
                    Carousel(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                      child: Footnote(
                        title: "All written information in this demonstration app is fetched from yogajournal. Illustrations are purchased through Lottie"
                      ),
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
