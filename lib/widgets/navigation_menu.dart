import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/authentication.dart';
import 'package:jamal_v1/ui/do_workout.dart';
import 'package:jamal_v1/ui/user_info.dart';
import 'package:jamal_v1/ui/exercises_page.dart';

import 'package:jamal_v1/ui/home_page.dart';
import 'package:jamal_v1/ui/measurements.dart';
import 'package:jamal_v1/ui/settings.dart';
import 'package:jamal_v1/ui/suggester.dart';
import 'package:jamal_v1/net/auth.dart' as auth;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:jamal_v1/net/database.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    String name = 'Jason';
    String email = 'jason@abc.com';
    String urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            /*onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'Sarah Abs',
                  urlImage: urlImage,
                ),
              )),
            ),*/
            Container(
              padding: padding,
              child: Column(
                children: [
                  //const SizedBox(height: 12),
                  //buildSearchField(),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Do a Workout',
                    icon: Icons.fitness_center_outlined,
                    onClicked: () async {
                      FitnessLevel userFitness = await DatabaseService()
                          .getFitnessLevel(uid)
                          .then((value) => (Enums.enumFromString<FitnessLevel>(
                              value, FitnessLevel.values)));

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DoWorkout(
                          userFitness: userFitness,
                        ),
                      ));
                    },
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Browse Exercises',
                    icon: Icons.directions_run_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Add Measurements',
                    icon: Icons.add,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 5),
                  ),

                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () {
                      FirebaseAuth.instance.signOut();
                      selectedItem(context, 6);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    String email,
    VoidCallback onClicked,
  }) =>
      InkWell(
          onTap: onClicked,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('particulars')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container(
                  padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
                  child: Row(
                    children: snapshot.data.docs
                        .where((document) => document.id == uid)
                        .map((document) {
                      // print(document.id);
                      // if (document.id == uid) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              "assets/avatars/avatar${document.data()['avatarChoice']}.png",
                            ),
                            //backgroundImage: NetworkImage(urlImage)
                          ),
                          SizedBox(width: 15),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfilePage(),
                              ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "${document.data()['name']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "${document.data()['email']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    // Spacer(),
                                    // CircleAvatar(
                                    //   radius: 20,
                                    //   backgroundColor: Color.fromRGBO(30, 60, 208, 1),
                                    //   child: Icon(Icons.add_comment_outlined,
                                    //       color: Colors.white),
                                    // )
                                  ]),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }));

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DoWorkout(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExercisePage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddMeasurementsPage(),
        ));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LocalSettings(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Authentication(),
        ));
        break;
    }
  }
}
