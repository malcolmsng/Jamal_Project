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
    String urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    // UserInformation userInfo = UserInformation(uid);
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.transparent,
            // elevation: 0,
            ),
        drawer: NavigationDrawerWidget(),
        body: Center(
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
                      return Container(
                          child: Column(
                        children: [
                          SizedBox(height: 24),
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                  image: NetworkImage(urlImage),
                                  fit: BoxFit.cover,
                                  width: 128,
                                  height: 128,
                                  child: InkWell(onTap: () {})),
                            ),
                          ),
                          SizedBox(height: 24),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text("${document.data()['name']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
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
                            child: Text("Height: ${document.data()['height']}",
                                style: TextStyle(fontSize: 24)),
                            //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                          ),
                          SizedBox(height: 24),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text("Weight: ${document.data()['weight']}",
                                style: TextStyle(fontSize: 24)),
                            //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                          ),
                        ],
                      ));
                    }).toList(),
                  );
                })));
  }
}
