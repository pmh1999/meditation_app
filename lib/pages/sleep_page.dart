import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/utils/theme.dart';
import 'package:meditation_app/widgets/reponsive_builder.dart';
import 'package:meditation_app/component/TopicGrid2.dart';

final topicStorage = RemoteTopicStorage();

class Sleep extends StatelessWidget {
  const Sleep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sleep Stories",
              style: PrimaryFont.bold(20),
            ),
            Text(
              'Soothing bedtime stories to help you to fall\ninto a deep and natural sleep',
              style: PrimaryFont.light(15),
            ),
          ],
        )),
        const Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Topic(),
        )
      ],
    );
  }
}

class Topic extends StatefulWidget {
  const Topic({Key? key}) : super(key: key);

  @override
  State<Topic> createState() => _TopicState();
}

class _TopicState extends State<Topic> with TickerProviderStateMixin {
  TabController? _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  List<bool> isSelected = [true, false, false, false, false];
  @override
  void dispose() {
    super.dispose();
    _nestedTabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: TabBar(
              controller: _nestedTabController,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              tabs: [
                _horizonListViewItem(
                    imgAsset: "images/all.png",
                    title: 'All',
                    bgColor: Color(0xffA0A3B1),
                    titleColor: Color(0xffA0A3B1)),
                _horizonListViewItem(
                    imgAsset: "images/favorite.png",
                    title: 'All',
                    bgColor: Color(0xffA0A3B1),
                    titleColor: Color(0xffA0A3B1)),
                _horizonListViewItem(
                    imgAsset: "images/anxious.png",
                    title: 'All',
                    bgColor: Color(0xffA0A3B1),
                    titleColor: Color(0xffA0A3B1)),
                _horizonListViewItem(
                    imgAsset: "images/sleep_tab.png",
                    title: 'All',
                    bgColor: Color(0xffA0A3B1),
                    titleColor: Color(0xffA0A3B1)),
                _horizonListViewItem(
                    imgAsset: "images/kids.png",
                    title: 'All',
                    bgColor: Color(0xffA0A3B1),
                    titleColor: Color(0xffA0A3B1)),
              ]),
          // Tabs Contents
        ),
        Flexible(
            flex: 4,
            child: TabBarView(
              controller: _nestedTabController,
              children: [
                Column(
                  children: [
                    Expanded(
                        child: Highlight(
                            title: "Daily though",
                            description: "MEDITATION 3-10 MIN",
                            url: "images/boxbg.png")),
                    Flexible(flex: 3, child: Container())
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        child: Highlight(
                            title: "Daily though",
                            description: "MEDITATION 3-10 MIN",
                            url: "images/boxbg.png")),
                    Flexible(flex: 3, child: Container())
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        child: Highlight(
                            title: "Daily though",
                            description: "MEDITATION 3-10 MIN",
                            url: "images/boxbg.png")),
                    Flexible(flex: 3, child: Container())
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        child: Highlight(
                            title: "Daily though",
                            description: "MEDITATION 3-10 MIN",
                            url: "images/boxbg.png")),
                    Flexible(flex: 3, child: Container())
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        child: Highlight(
                            title: "Daily though",
                            description: "MEDITATION 3-10 MIN",
                            url: "images/boxbg.png")),
                    Flexible(flex: 3, child: TopicGrid2())
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

Widget _horizonListViewItem(
    {Color? bgColor,
    @required String imgAsset = "",
    @required String title = "",
    Color? titleColor}) {
  return SizedBox(
    height: 110,
    child: Tab(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                color: bgColor ?? Color(0xff586894),
              ),
              child: Image(
                image: AssetImage(imgAsset),
                width: 25.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                title,
                style: TextStyle(color: titleColor ?? Color(0xff98A1BD)),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
