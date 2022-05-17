import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/pages/choose_topic_page.dart';
import 'package:meditation_app/pages/get_started_page.dart';
import 'package:meditation_app/pages/reminders_page.dart';
import 'package:meditation_app/pages/playlist.dart';
import 'package:meditation_app/pages/main_page.dart';
import 'package:meditation_app/provider/DarkThemeNotifier.dart';
import 'package:meditation_app/utils/ThemeData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final preferences = await SharedPreferences.getInstance();
  runApp(
    MyApp(preferences: preferences), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  MyApp({
    required this.preferences,
  });
  @override
  Widget build(BuildContext context) {
    /// Here we are asynchronously passing an instance of SharedPreferences
    /// to our Settings ChangeNotifier class and that in turn helps us
    /// determine the basic app settings to be applied whenever the app is
    /// launched.
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProvider<DarkThemeNotifier>(
            create: (_) => DarkThemeNotifier(preferences),
            child: new _MyApp(),
          );
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(true, context),
      initialRoute: '$MainPage',
      routes: {
        '$GetStartedPage': (_) => const GetStartedPage(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
        '$RemindersPage': (_) => const RemindersPage(),
        '$MainPage': (_) => const MainPage(),
        '$PlayList': (_) => PlayList(
              title: "Happy morning\n",
            ),
      },
    );
  }
}
