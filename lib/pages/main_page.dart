import 'package:flutter/material.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/pages/sleep_page.dart';
import 'package:meditation_app/pages/music_page.dart';
import 'package:meditation_app/pages/meditation_page.dart';
import 'package:meditation_app/pages/music_page.dart';
import 'package:meditation_app/pages/settings_page.dart';
import 'package:meditation_app/pages/playlist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meditation_app/provider/DarkThemeNotifier.dart';
import 'package:meditation_app/pages/reminders_page.dart';
import 'package:meditation_app/utils/ThemeData.dart';
import 'package:meditation_app/widgets/reponsive_builder.dart';

final topicStorage = RemoteTopicStorage();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkThemeNotifier>(context).isDarkMode;
    ThemeData _style = Styles.themeData(isDark, context);
    return Scaffold(
        backgroundColor: _style.backgroundColor,
        body: SafeArea(
          child: _selectedIndex == 0
              ? Home()
              : _selectedIndex == 1
                  ? const Sleep()
                  : _selectedIndex == 2
                      ? const Meditate()
                      : _selectedIndex == 3
                          ? PlayList(title: "Happy morning\n")
                          : _selectedIndex == 4
                              ? const Settings()
                              : Container(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/home.png"),
              ),
              label: 'Home',
              backgroundColor: _style.backgroundColor,
              activeIcon: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Container(
                    color: const Color(0xff8E97FD),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("images/home.png"),
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/sleep.png")),
              label: 'Sleep',
              backgroundColor: _style.backgroundColor,
              activeIcon: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Container(
                    color: const Color(0xff8E97FD),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("images/sleep.png"),
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/meditate.png")),
              label: 'Meditate',
              backgroundColor: _style.backgroundColor,
              activeIcon: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Container(
                    color: const Color(0xff8E97FD),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("images/meditate.png"),
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/music.png")),
              activeIcon: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Container(
                    color: const Color(0xff8E97FD),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("images/music.png"),
                        color: Colors.white,
                      ),
                    ),
                  )),
              label: 'Music',
              backgroundColor: _style.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/profile.png")),
              label: 'Asfar',
              backgroundColor: _style.backgroundColor,
              activeIcon: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  child: Container(
                    color: const Color(0xff8E97FD),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageIcon(
                        AssetImage("images/profile.png"),
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: _style.primaryColor,
          unselectedItemColor: kColorLightGrey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }
}
