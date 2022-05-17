import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/pages/playlist.dart';
import 'package:meditation_app/utils/theme.dart';

class Highlight extends StatelessWidget {
  String title;
  String description;
  String url;
  Color color;
  Highlight(
      {Key? key,
      required this.title,
      required this.description,
      required this.url,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:
                title == "Daily calm" ? Color(0xfff9dfce) : Color(0xff333242),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(image: AssetImage(url)),
          ),
          child: Row(children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: PrimaryFont.bold(
                                context.screenSize.shortestSide * 0.05)
                            .copyWith(color: color),
                      ),
                      Text(
                        description,
                        style: PrimaryFont.light(
                                context.screenSize.shortestSide * 0.03)
                            .copyWith(color: color),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 253, 251, 251),
                    border: Border.all(
                      color: const Color(0xFFA1A4B2),
                    ),
                  ),
                  child: const Center(
                    child: FittedBox(child: Icon(Icons.play_arrow)),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('$PlayList');
      },
    );
  }
}
