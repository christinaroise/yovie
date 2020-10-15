import 'package:flutter/material.dart';
import 'package:yovie_app/components/bars/progress_bar.dart';
import 'package:yovie_app/components/texts/footnote.dart';
import 'package:yovie_app/components/texts/h3_title.dart';
import 'package:yovie_app/theme/style.dart';

class Tile extends StatefulWidget {
  final String nickname;
  final String poseLevel;
  final String imageUrl;

  const Tile ({Key key, this.nickname, this.poseLevel, this.imageUrl}) : super (key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 70,
              decoration: new BoxDecoration(
                  color: CustomTheme.primaryColor,
                  borderRadius: new BorderRadius.circular(10)
              ),
              child: Center(child: Image.network(widget.imageUrl)),
            ),
           Container(
             width: 200,
             child: Padding(
               padding: const EdgeInsets.fromLTRB(10, 8, 10, 2.5),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   H3Title(
                      title: widget.nickname,
                   ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 4),
                         child: Footnote(
                           title: "2,5 minutes",
                         ),
                       ),
                     ],
                   ),
                   Spacer(),
                   Container(
                     width: 150,
                     child: ProgressBar(),
                   )
                 ],
               ),
             ),
           ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 5),
              child: Column(
                children: [
                  Footnote(
                    title: "Level " + widget.poseLevel,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
