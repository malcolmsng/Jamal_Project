import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOfWorkouts extends StatefulWidget {
  @override
  _ListOfWorkoutsState createState() => _ListOfWorkoutsState();
}

class _ListOfWorkoutsState extends State<ListOfWorkouts> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('particulars')
            .doc(uid)
            .collection('workouts')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("no data");
          }
          //return Text(snapshot.data.docs.toString());
          print("this is ");
          print(snapshot);
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Text(document['date']);
            }).toList(),
          );
        },
      ),
    );
  }
}
