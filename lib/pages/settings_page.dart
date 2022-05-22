import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/provider/DarkThemeNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/utils/ThemeData.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool isDark = true;
  ThemeData? _style;

  @override
  void didChangeDependencies() {
    isDark = Provider.of<DarkThemeNotifier>(context).isDarkMode;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DarkThemeNotifier _themeChanger = Provider.of<DarkThemeNotifier>(context);
    _style = Styles.themeData(isDark, context);
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isDark
                  ? SvgPicture.asset('assets/images/ic_logo.svg')
                  : SvgPicture.asset('assets/images/ic_logo_light.svg'),
              Text(
                'Meditate app. Find some peace\n of mind to prepare for meditation.',
                style: PrimaryFont.light(15).copyWith(color: _style?.cardColor),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
            child: TextButton(
              child: Row(
                children: [
                  Text(
                    'Dark mode',
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 30,
                    child: CupertinoSwitch(
                        value: _themeChanger.isDarkMode == false ? false : true,
                        activeColor: Color(0xffFFCF86),
                        trackColor: Color(0xff64637D),
                        onChanged: (value) {
                          _themeChanger.setDarkMode(value);
                        }),
                  )
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff3F414E),
                primary: const Color(0xffFFCF86),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              onPressed: () {
                _themeChanger.setDarkMode(!_themeChanger.isDarkMode);
              },
            ),
          ),
        ),
        Flexible(flex: 3, child: Container()),
      ],
    );
  }
}
