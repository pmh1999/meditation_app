import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/pages/playlist.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/component/highlight.dart';
import 'package:meditation_app/utils/ThemeData.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/provider/DarkThemeNotifier.dart';

bool isDark = true;
ThemeData? _style;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool isDark = true;

  @override
  void didChangeDependencies() {
    isDark = Provider.of<DarkThemeNotifier>(context).isDarkMode;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _style = Styles.themeData(isDark, context);
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(isDark
                ? 'assets/images/ic_logo.svg'
                : 'assets/images/ic_logo_light.svg'),
          ),
        ),
        const Expanded(
          child: Goodmorning(),
        ),
        const Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: FeatureList(),
        ),
        Expanded(
            child: Highlight(
                title: "Daily though",
                description: "MEDITATION 3-10 MIN",
                url: "images/boxbg.png",
                color: Colors.white)),
        Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Recommended for you',
                          style: PrimaryFont.bold(
                                  context.screenSize.shortestSide * 0.06)
                              .copyWith(color: _style?.cardColor),
                        )),
                  ),
                ),
                const Flexible(
                  flex: 5,
                  child: RecommendedList(),
                ),
              ],
            )),
      ],
    );
  }
}

class Goodmorning extends StatelessWidget {
  const Goodmorning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning, Asfar',
              style: PrimaryFont.bold(context.screenSize.shortestSide * 0.07)
                  .copyWith(
                height: 1.5,
                color: _style?.cardColor,
              ),
            ),
            Text(
              'We wish you have a good day',
              style: PrimaryFont.light(context.screenSize.shortestSide * 0.05)
                  .copyWith(height: 1.5, color: _style?.cardColor),
            )
          ]),
    );
  }
}

List<Topic> featuredList = [
  const Topic(
      title: "Basics",
      thumbnail: "assets/images/apple.png",
      color: "0xff8E97FD",
      titleColor: "0xffFFECCC"),
  const Topic(
      title: "Relaxation",
      thumbnail: "assets/images/listen.png",
      color: "0xffFFDB9D",
      titleColor: "0xff3F414E"),
];
List<Topic> recommended = [
  const Topic(
      title: "Focus",
      thumbnail: "assets/images/focus.png",
      color: "0xffAFDBC5",
      titleColor: "0xFFFFFFFF"),
  const Topic(
      title: "Happiness",
      thumbnail: "assets/images/happiness.png",
      color: "0xffFFC97E",
      titleColor: "0xFFFFFFFF"),
  const Topic(
      title: "Focus",
      thumbnail: "assets/images/focus.png",
      color: "0xffAFDBC5",
      titleColor: "0xFFFFFFFF"),
  const Topic(
      title: "Happiness",
      thumbnail: "assets/images/happiness.png",
      color: "0xffFFC97E",
      titleColor: "0xFFFFFFFF"),
  const Topic(
      title: "Focus",
      thumbnail: "assets/images/focus.png",
      color: "0xffAFDBC5",
      titleColor: "0xFFFFFFFF"),
  const Topic(
      title: "Happiness",
      thumbnail: "assets/images/happiness.png",
      color: "0xffFFC97E",
      titleColor: "0xFFFFFFFF"),
];

class RecommendedList extends StatelessWidget {
  const RecommendedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: recommended.length,
      itemBuilder: (context, index) {
        final topic = recommended[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: FittedBox(
              child: InkWell(
            child: Container(
              width: 162,
              height: 181.0,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    padding: const EdgeInsets.only(
                        bottom: 5.0, left: 5.0, right: 5.0, top: 10.0),
                    child: Text(
                      topic.title,
                      style: PrimaryFont.bold(18.0)
                          .copyWith(color: _style?.cardColor),
                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        children: [
                          // Box Type
                          Text("SLEEP MUSIC",
                              style: PrimaryFont.light(11.0)
                                  .copyWith(color: _style?.cardColor)),
                          // Dot
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: EdgeInsets.all(1.5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)), //here
                                color: _style?.cardColor,
                              ),
                            ),
                          ),
                          // Box Time
                          Text(
                            '40 MIN',
                            style: PrimaryFont.light(11.0)
                                .copyWith(color: _style?.cardColor),
                          )
                        ],
                      )),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('$PlayList');
            },
          )),
        );
      },
    );
  }
}

class FeatureList extends StatelessWidget {
  const FeatureList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: featuredList.length,
      itemBuilder: (context, index) {
        final topic = featuredList[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('$PlayList');
          },
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(context.screenSize.width * 0.02, 0, 0, 0),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: topic.bgColor, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: context.screenSize.width * 0.45,
                          child: Image(
                              image: AssetImage(
                            topic.thumbnail,
                          ))),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(topic.title,
                            style: PrimaryFont.bold(
                                    context.screenSize.shortestSide * 0.04)
                                .copyWith(color: topic.textColor)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('5 - 10 MIN',
                                style: PrimaryFont.light(
                                        context.screenSize.shortestSide * 0.03)
                                    .copyWith(color: topic.textColor)),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text('Start'),
                              style: TextButton.styleFrom(
                                backgroundColor: kColorDarkGrey,
                                primary: kColorLightYellow,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('$PlayList');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
