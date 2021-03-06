import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/pages/Playlist.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/utils/ThemeData.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/provider/DarkThemeNotifier.dart';

List<Topic> list = [
  const Topic(
      title: "7 Days of Calm",
      thumbnail: "assets/images/meditate_one.png",
      color: "0xff8E97FD",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Anxiet Release",
      thumbnail: "assets/images/meditate_two.png",
      color: "0xffFFDB9D",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Anxiet Release",
      thumbnail: "assets/images/meditate_three.png",
      color: "0xff8E97FD",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Anxiet Release",
      thumbnail: "assets/images/meditate_four.png",
      color: "0xffFFDB9D",
      titleColor: "0xffFFECCC"),
];

bool isDark = true;
ThemeData? _style;

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
  void didChangeDependencies() {
    isDark = Provider.of<DarkThemeNotifier>(context).isDarkMode;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _style = Styles.themeData(isDark, context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: _style?.backgroundColor,
            expandedHeight: context.screenSize.height * 0.15,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Meditate",
                    style:
                        PrimaryFont.bold(20).copyWith(color: _style?.cardColor),
                  ),
                  Text(
                    'we can learn how to recognize when our minds\n are doing their normal everyday acrobatics',
                    style: PrimaryFont.light(15)
                        .copyWith(color: _style?.cardColor),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            elevation: 1,
            backgroundColor: _style?.backgroundColor,
            pinned: true,
            bottom: TabBar(
                controller: _nestedTabController,
                indicatorColor: _style?.primaryColor,
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
                              url: "images/daily_calm.png",
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                          child: MasonryGridView.count(
                        crossAxisCount: 2,
                        itemCount: list.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        itemBuilder: (context, index) {
                          final topic = list[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('$PlayList');
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: topic.bgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  LayoutBuilder(
                                      builder: (context, constraints) {
                                    return Image(
                                        image: AssetImage(topic.thumbnail));
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      list[index].title,
                                      style: PrimaryFont.bold(
                                              context.screenSize.shortestSide *
                                                  0.04)
                                          .copyWith(color: topic.textColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))
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
