import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/utils/theme.dart';
import 'package:meditation_app/widgets/reponsive_builder.dart';
import 'package:meditation_app/component/TopicGrid2.dart';
import 'package:lottie/lottie.dart';

import 'dart:math' as Math;

class PlayList extends StatefulWidget {
  final String title;
  const PlayList({Key? key, required this.title}) : super(key: key);
  @override
  State<PlayList> createState() => PlayListState();
}

class PlayListState extends State<PlayList>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Map> musics = [
    {"name": "Focus Attention", "time": "10 MIN"},
    {"name": "Body Scan", "time": "4 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Making Happiness", "time": "7 MIN"},
    {"name": "Focus Attention", "time": "7 MIN"},
    {"name": "Body Scan", "time": "7 MIN"},
    {"name": "Body Scan", "time": "7 MIN"},
    {"name": "Body Scan1", "time": "7 MIN"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 480,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //top image
                        Container(
                          height: 270.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage("images/nightly_thought.png"),
                                fit: BoxFit.fitWidth,
                              )),
                          child: Stack(
                            children: [
                              // back button
                              Positioned(
                                top: 40,
                                right: 30,
                                child: //back
                                    Container(
                                        decoration: ShapeDecoration(
                                          color: const Color(0xffF2F2F2),
                                          shape: const CircleBorder(),
                                        ),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Transform.rotate(
                                            angle: Math.pi / 180 * 180,
                                            child: Image(
                                              image:
                                                  AssetImage("images/back.png"),
                                              color: Color(0xff3F414E),
                                              width: 18.0,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                              ),

                              //cloud
                              Positioned(
                                  top: 10.0,
                                  left: 20.0,
                                  child: Image(
                                    image: AssetImage('images/cloud.png'),
                                    width: 50,
                                    color: Color(0xff616077).withOpacity(.3),
                                  )),
                              //cloud
                              Positioned(
                                  top: 130.0,
                                  right: 20.0,
                                  child: Image(
                                    image: AssetImage('images/cloud.png'),
                                    width: 50,
                                    color: Color(0xff616077).withOpacity(.3),
                                  )),
                              //botton clouds
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Image(
                                    image: AssetImage('images/cloud_top.png'),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image(
                                  image: AssetImage('images/cloud_center.png'),
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image(
                                    image:
                                        AssetImage('images/cloud_bottom.png'),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              //fins
                              Positioned(
                                top: 140.0,
                                right: 90.0,
                                child: Transform.rotate(
                                  angle: 5.0,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 190.0,
                                right: 80.0,
                                child: Transform.rotate(
                                  angle: 5.5,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 210.0,
                                right: 20.0,
                                child: Transform.rotate(
                                  angle: 6.3,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //title & description
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: RichText(
                            text: TextSpan(
                              text: widget.title,
                              style: PrimaryFont.bold(34).copyWith(
                                color: const Color(0xff3F414E),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Music\n',
                                    style: PrimaryFont.bold(14).copyWith(
                                        color: const Color(0xffA1A4B2),
                                        height: 3.0)),
                                TextSpan(
                                    text: 'Description',
                                    style: PrimaryFont.medium(13).copyWith(
                                        color: const Color(0xffA1A4B2))),
                                TextSpan(
                                    text: '\n\nNarrator',
                                    style: PrimaryFont.bold(20).copyWith(
                                        color: const Color(0xff3F414E))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //TabBar
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  snap: false,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    labelColor: const Color(0xff8E97FD),
                    unselectedLabelColor: const Color(0xffA1A4B2),
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xff8E97FD)),
                        insets: EdgeInsets.symmetric(horizontal: 70.0)),
                    tabs: [
                      Tab(
                        child: Text(
                          'Voice',
                          style: TextStyle(letterSpacing: 1.0),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Favorite',
                          style: TextStyle(letterSpacing: 1.0),
                        ),
                      ),
                    ],
                  ),
                  expandedHeight: 30,
                ),

                //Voice & Favorite List
                SliverFillRemaining(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Voice Tab
                    Container(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: musics.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                    left: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      // play btn
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                              width: 1,
                                            )),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/play.png"),
                                            width: 12.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // voice title & time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musics[index]["name"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              musics[index]["time"],
                                              style: TextStyle(fontSize: 11.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              );
                            }),
                      ),
                    ),
                    // Favorite Tab
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
                )),
              ],
            ),
          ),
        ));
  }
}
