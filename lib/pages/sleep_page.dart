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
import 'package:meditation_app/pages/Playlist.dart';
import 'package:lottie/lottie.dart';

final topicStorage = RemoteTopicStorage();

List<Topic> list = [
  const Topic(
      title: "Night Island",
      thumbnail: "assets/images/sleep_grid_banner_one.png",
      color: "0xff8E97FD",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Sweet Sleep",
      thumbnail: "assets/images/sleep_grid_banner_two.png",
      color: "0xffFFDB9D",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Good Night",
      thumbnail: "assets/images/sleep_grid_banner_three.png",
      color: "0xff8E97FD",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Moon Clouds",
      thumbnail: "assets/images/sleep_grid_banner_four.png",
      color: "0xffFFDB9D",
      titleColor: "0xffFFECCC"),
];

class Sleep extends StatefulWidget {
  const Sleep({Key? key}) : super(key: key);

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> with TickerProviderStateMixin {
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
                    "Sleep",
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
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: context.screenSize.height * 0.2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/sleep_banner.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "The Ocean Moon",
                                    style: PrimaryFont.bold(20)
                                        .copyWith(color: kColorLightYellow),
                                  ),
                                  Text(
                                    "Non-stop 8-hour mixes of our\n most popular sleep audio",
                                    style: PrimaryFont.medium(10)
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextButton(
                                    child: Text('Start'),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      primary: kColorLightYellow,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                    ),
                                    onPressed: () {},
                                  ),
                                ]),
                          ),
                        ),
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
                          return FittedBox(
                              child: InkWell(
                            child: Container(
                              width: 162,
                              height: 181.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                //color: topic.bgColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // top image
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        color: topic.bgColor,
                                        child: Image(
                                          height: 115.0,
                                          image: AssetImage(topic.thumbnail),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text Title
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5.0,
                                        left: 5.0,
                                        right: 5.0,
                                        top: 10.0),
                                    child: Text(
                                      topic.title,
                                      style: PrimaryFont.bold(18.0)
                                          .copyWith(color: kColorText),
                                    ),
                                  ),

                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      child: Row(
                                        children: [
                                          // Box Type
                                          Text("SLEEP MUSIC",
                                              style: PrimaryFont.light(11.0)
                                                  .copyWith(color: kColorText)),
                                          // Dot
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              padding: EdgeInsets.all(1.5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)), //here
                                                color: kColorLightYellow,
                                              ),
                                            ),
                                          ),
                                          // Box Time
                                          Text(
                                            '40 MIN',
                                            style: PrimaryFont.light(11.0)
                                                .copyWith(color: kColorText),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ));
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
