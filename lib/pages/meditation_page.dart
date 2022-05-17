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
import 'package:lottie/lottie.dart';

final topicStorage = RemoteTopicStorage();

class Meditate extends StatefulWidget {
  const Meditate({Key? key}) : super(key: key);

  @override
  State<Meditate> createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> with TickerProviderStateMixin {
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: context.screenSize.height * 0.15,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Meditate",
                    style: PrimaryFont.bold(20),
                  ),
                  Text(
                    'we can learn how to recognize when our minds\n are doing their normal everyday acrobatics',
                    style: PrimaryFont.light(15),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            pinned: true,
            bottom: TabBar(
                controller: _nestedTabController,
                indicatorColor: kColorPrimary,
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                tabs: [
                  _horizonListViewItem(
                      imgAsset: "images/all.png",
                      title: 'All',
                      bgColor: Color(0xffA0A3B1),
                      titleColor: Color(0xffA0A3B1)),
                  _horizonListViewItem(
                      imgAsset: "images/favorite.png",
                      title: 'My',
                      bgColor: Color(0xffA0A3B1),
                      titleColor: Color(0xffA0A3B1)),
                  _horizonListViewItem(
                      imgAsset: "images/anxious.png",
                      title: 'Anxious',
                      bgColor: Color(0xffA0A3B1),
                      titleColor: Color(0xffA0A3B1)),
                  _horizonListViewItem(
                      imgAsset: "images/sleep_tab.png",
                      title: 'Sleep',
                      bgColor: Color(0xffA0A3B1),
                      titleColor: Color(0xffA0A3B1)),
                  _horizonListViewItem(
                      imgAsset: "images/kids.png",
                      title: 'Kids',
                      bgColor: Color(0xffA0A3B1),
                      titleColor: Color(0xffA0A3B1)),
                ]),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                controller: _nestedTabController,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                            height: context.screenSize.height * 0.13,
                            child: Highlight(
                                title: "Daily calm",
                                description: "MEDITATION 3-10 MIN",
                                url: "images/daily_calm.png")),
                      ),
                      const Expanded(child: TopicGrid2())
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Lottie.asset(
                            'images/meditating_lady.json',
                            height: 350.0,
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Lottie.asset(
                            'images/meditating_lady.json',
                            height: 350.0,
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Lottie.asset(
                            'images/meditating_lady.json',
                            height: 350.0,
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Lottie.asset(
                            'images/meditating_lady.json',
                            height: 350.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _horizonListViewItem(
    {Color? bgColor,
    @required String imgAsset = "",
    @required String title = "",
    Color? titleColor}) {
  return SizedBox(
    height: 100,
    child: Tab(
      child: Container(
        padding: EdgeInsets.only(top: 0.0),
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
