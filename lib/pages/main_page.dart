import 'package:flutter/material.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/pages/sleep_page.dart';
import 'package:meditation_app/pages/music_page.dart';
import 'package:meditation_app/pages/meditation_page.dart';
import 'package:meditation_app/pages/music_page.dart';
import 'package:meditation_app/pages/settings_page.dart';
import 'package:meditation_app/pages/playlist.dart';

import 'package:meditation_app/pages/reminders_page.dart';
import 'package:meditation_app/utils/theme.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _selectedIndex == 0
              ? const Home()
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/home.png")),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/sleep.png")),
              label: 'Sleep',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/meditate.png")),
              label: 'Meditate',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/music.png")),
              label: 'Music',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/profile.png")),
              label: 'Asfar',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kColorPrimary,
          unselectedItemColor: kColorDarkGrey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }
}
