import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:jamal_v1/model/user_particulars.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference particularsCollection =
      FirebaseFirestore.instance.collection('particulars');

  Future updateUserData(
      String email,
      String password,
      String name,
      String age,
      String height,
      String weight,
      String bodyFatPercentage,
      String fitnessLevel) async {
    // retrieve current date
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(now);

    await particularsCollection
        .doc(uid)
        .collection('measurements')
        .doc(now)
        .set({
      'height': height,
      'weight': weight,
      'bodyFat': '30',
    });

    return await particularsCollection.doc(uid).set({
      "email": email,
      "password": password,
      "name": name,
      "age": age,
      "height": height,
      "weight": weight,
      "bodyFatPercentage": bodyFatPercentage,
      "fitnessLevel": fitnessLevel,
    });
  }

  Future addWorkout(String workoutType, String workout) async {
    final CollectionReference workoutsCollection = FirebaseFirestore.instance
        .collection('particulars')
        .doc(uid)
        .collection('workouts');

    return await workoutsCollection.doc(workoutType).set({
      "exercise": workout,
    });
  }

  Future addMeasurements(
      String height, String weight, String fitnessLevel) async {
    // retrieve current date
    String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(now);

    return await particularsCollection
        .doc(uid)
        .collection('measurements')
        .doc(now)
        .set({
      'height': height,
      'weight': weight,
      'bodyFat': '30',
    });
  }

  // get a particulars list from snapshot so we dont have to keep retrieving
  List<UserParticulars> _particularsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return UserParticulars(
        name: document.data()['name'] ?? "no name",
        age: document.data()['age'] ?? "no age",
        height: document.data()['height'] ?? "no height",
        weight: document.data()['weight'] ?? "no weight",
        fitnessLevel: document.data()['fitnessLevel'] ?? "no fitnessLevel",
      );
    }).toList();
  }

  // get particulars stream
  Stream<List<UserParticulars>> get particularsStream {
    return particularsCollection.snapshots().map(_particularsListFromSnapshot);
  }
}
