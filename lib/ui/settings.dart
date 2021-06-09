import 'package:flutter/material.dart';
import 'package:jamal_v1/widgets/features.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> settingTitles = [
    "Privacy",
    "Profile",
    "Notifications",
    "Storage",
    "FAQs",
    "Invite friends",
    "App theme",
    "Log out"
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavigationDrawerWidget(),
      body: Stack(children: [
        SizedBox(
          child: Image.asset("assets/bg.jpg"),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Text(
                  // insert user's name here
                  "Settings",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    for (final title in settingTitles)
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text(title,
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            )),
      ]),
    );
  }
}
