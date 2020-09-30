import 'package:flutter/material.dart';
import 'package:yovie_app/components/buttons/custom_button.dart';
import 'package:yovie_app/components/buttons/custom_icon_button.dart';
import 'package:yovie_app/theme/style.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;

  const InfoCard({Key key,
    this.title,
    this.subtitle,
    this.description
}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> with SingleTickerProviderStateMixin {
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
    return Column(
      children: [
        Card(
          color: CustomTheme.primaryColor,
          elevation: 2,
          margin: EdgeInsets.only(left: 20, right: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: new AssetImage('assets/gifs/tempgif.gif')),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: CustomTheme.yellowColor,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                        color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[800],
                          height: 1
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            child: CustomButton(
                              title: "Learn more",
                              onTap: (){},
                            ),
                          ),
                          Spacer(),
                          CustomIconButton()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
