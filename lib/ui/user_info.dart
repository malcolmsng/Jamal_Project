import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // UserInformation userInfo = UserInformation(uid);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        drawer: NavigationDrawerWidget(),
        body: Stack(children: [
          SizedBox(
            child: Image.asset("assets/bg.jpg"),
          ),
          Center(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('particulars')
                      //.doc(FirebaseAuth.instance.currentUser.uid)
                      // .collection('Coins')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: snapshot.data.docs
                          .where((document) => document.id == uid)
                          .map((document) {
                        // print(document.id);
                        // if (document.id == uid) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.05,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Profile page",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                ),
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Image.asset(
                                        "assets/avatars/avatar${document.data()['avatarChoice']}.png",
                                        width: 128),
                                  ),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("${document.data()['name']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("${document.data()['email']}",
                                      style: TextStyle(fontSize: 24)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text("Age: ${document.data()['age']}",
                                      style: TextStyle(fontSize: 24)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      "Fitness Level: ${document.data()['fitnessLevel']}",
                                      style: TextStyle(fontSize: 24)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      "Height: ${document.data()['height']}",
                                      style: TextStyle(fontSize: 24)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                                SizedBox(height: 24),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      "Weight: ${document.data()['weight']}",
                                      style: TextStyle(fontSize: 24)),
                                  //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                                ),
                              ],
                            ));
                      }).toList(),
                    );
                  })),
        ]));
  }
}
