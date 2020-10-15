import 'package:flutter/material.dart';
import 'package:yovie_app/components/buttons/custom_button.dart';
import 'package:yovie_app/components/buttons/custom_icon_button.dart';
import 'package:yovie_app/components/texts/h1_title.dart';
import 'package:yovie_app/components/texts/paragraph.dart';
import 'package:yovie_app/theme/style.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final Function onPressed;
  final Function onPressedIcon;

  const InfoCard({Key key,
    this.title,
    this.subtitle,
    this.description,
    this.imageUrl,
    this.onPressed,
    this.onPressedIcon
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.only(left: 20, right: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: ( widget.imageUrl != null) ? Image.network(
                    widget.imageUrl,
                  ) : Center(child: CircularProgressIndicator()),
                ),
                Center(
                  child: H1Title(
                    title: widget.title,
                    centered: true,
                  )
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                      color: Colors.grey,
                      height: 1.2
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Paragraph(
                    text: widget.description,
                    height: 1.1,
                  )
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        child: CustomButton(
                          title: "More",
                          onTap: widget.onPressed,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: CustomIconButton(
                          onTap: widget.onPressedIcon,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
