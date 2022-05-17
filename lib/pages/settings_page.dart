import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/utils/theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isDark
                  ? SvgPicture.asset('assets/images/ic_logo.svg')
                  : SvgPicture.asset('assets/images/ic_logo_light.svg'),
              Text(
                'Meditate app. Find some peace\n of mind to prepare for meditation.',
                style: isDark
                    ? PrimaryFont.light(15)
                    : PrimaryFont.light(15).copyWith(color: kColorLightGrey),
              )
            ],
          ),
        ),
        Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: !isDark ? Color(0xfff9dfce) : Color(0xff333242),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                                "Dark mode",
                                style: PrimaryFont.bold(
                                        context.screenSize.shortestSide * 0.05)
                                    .copyWith(
                                        color: isDark
                                            ? Color(0xffEBEAEC)
                                            : kColorDarkGrey),
                              ),
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
                setState(() {
                  isDark == true;
                });
              },
            )),
      ],
    );
  }
}
