import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:jamal_v1/model/user_particulars.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference particularsCollection =
      FirebaseFirestore.instance.collection('particulars');

  Future<String> getFitnessLevel(String uid) async {
    return await particularsCollection
        .doc(uid)
        .get()
        .then((value) => value.data()['fitnessLevel']);
  }

  Future updateUserData(
      String avatarChoice,
      String email,
      String password,
      String name,
      String age,
      String height,
      String weight,
      String bodyFatPercentage,
      String fitnessLevel) async {
    // retrieve current date
    String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(dateNow);

    await particularsCollection
        .doc(uid)
        .collection('measurements')
        .doc(dateNow)
        .set({
      'height': int.parse(height),
      'weight': int.parse(weight),
      'bodyFat': int.parse(bodyFatPercentage),
      'date': dateNow.substring(8, 10) + '/' + dateNow.substring(5, 7),
    });

    // await particularsCollection
    //     .doc(uid)
    //     .collection('workout')
    //     .doc(dateNow)
    //     .set({
    //   'placeholder': "hold",
    // });

    return await particularsCollection.doc(uid).set({
      "avatarChoice": avatarChoice,
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

  Future updateProfilePicture(
    String avatarChoice,
  ) async {
    return await particularsCollection.doc(uid).update({
      "avatarChoice": avatarChoice,
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

  Future addWorkoutList(List<List<String>> listOfListOfWorkouts) async {
    String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(dateNow);

    final CollectionReference workoutsCollection = FirebaseFirestore.instance
        .collection('particulars')
        .doc(uid)
        .collection('workouts');

    for (var i in listOfListOfWorkouts) {
      print(i);
      String combinedSetsAndReps = i[1] + i[2];
      await workoutsCollection.doc(dateNow).update({
        i[0]: combinedSetsAndReps,
      });
    }

    // return await workoutsCollection.doc(dateNow).set({
    //   for (var  i in listOfWorkouts) {
    //     "exercise": i;
    //   }
    // }
    // );
  }

  Future addWorkoutListWithDate(String workoutDate,
      List<List<String>> listOfListOfWorkouts, int volume) async {
    final CollectionReference workoutsCollection = FirebaseFirestore.instance
        .collection('particulars')
        .doc(uid)
        .collection('workouts');

    await workoutsCollection.doc(workoutDate).set({
      'placeholder': 'place',
    });

    for (var i in listOfListOfWorkouts) {
      print(i);
      String combinedSetsAndReps = i[1] + i[2];

      await workoutsCollection.doc(workoutDate).update({
        i[0]: combinedSetsAndReps,
      });
    }
    return await workoutsCollection.doc(workoutDate).update({
      'date': workoutDate.substring(8, 10) + '/' + workoutDate.substring(5, 7),
      'volume': volume,
    });
  }

  Future addMeasurementsWithDate(
      String workoutDate, String height, String weight, String bodyFat) async {
    return await particularsCollection
        .doc(uid)
        .collection('measurements')
        .doc(workoutDate)
        .set({
      'height': int.parse(height),
      'weight': int.parse(weight),
      'bodyFat': int.parse(bodyFat),
      'date': workoutDate.substring(8, 10) + '/' + workoutDate.substring(5, 7),
    });
  }

  Future retrieveWorkoutData() async {
    var docRef = FirebaseFirestore.instance.collection("particulars").doc(uid);

    docRef.get().then((doc) => {
          if (doc.exists)
            {
              //console.log("Document data:", doc.data());
              print(doc.data())
            }
          else
            {
              // doc.data() will be undefined in this case
              // console.log("No such document!");
              print("no such data")
            }
        });
  }

  Future retrieveMeasurements() async {
    var docRef = FirebaseFirestore.instance
        .collection("particulars")
        .doc(uid)
        .collection("measurements")
        .doc("height");

    docRef.get().then((doc) => {
          if (doc.exists)
            {
              //console.log("Document data:", doc.data());
              print(doc.data())
            }
          else
            {
              // doc.data() will be undefined in this case
              // console.log("No such document!");
              print("no such data")
            }
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
