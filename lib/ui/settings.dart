import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/ui/change_password.dart';
import 'package:jamal_v1/ui/change_prof_pic.dart';
import 'package:jamal_v1/ui/custom_exercises.dart';
import 'package:jamal_v1/ui/tempo.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class LocalSettings extends StatefulWidget {
  @override
  _LocalSettingsState createState() => _LocalSettingsState();
}

class _LocalSettingsState extends State<LocalSettings> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
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
                  height: screenSize.height * 0.02,
                ),
                Text(
                  // insert user's name here
                  "Settings",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 30),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: MaterialButton(
                //     color: Colors.lightBlue,
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => UserProfilePage(),
                //       ));
                //     },
                //     child: Text("View profile"),
                //   ),
                // ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeProfilePic(),
                          ),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text("Change profile picture",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[200],
                              //   border: Border.all(
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ),
                            Icon(IconData(61068,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true))
                          ]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text("Change password",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[200],
                              //   border: Border.all(
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ),
                            Icon(IconData(61068,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true))
                          ]),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomExercisesPage()),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text("Toggle app theme",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[200],
                              //   border: Border.all(
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ),
                            Icon(IconData(61068,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true))
                          ]),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text("Log out",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[200],
                              //   border: Border.all(
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ),
                            Icon(IconData(61068,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true))
                          ]),
                    ),
                  ],
                ),
              ],
            )),
      ]),
    );
  }
}
