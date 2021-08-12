import 'package:cloud_firestore/cloud_firestore.dart';

class VolumePerWorkout {
  String date;
  int amount;

  VolumePerWorkout(this.date, this.amount);

  VolumePerWorkout.fromMap(Map<String, dynamic> map) {
    // assert(map['weight'] != null),
    date = map['date'];
    // var tempholder = 0;
    // if (map['situp'] != null) {
    //   tempholder += int.parse(map['pushup'].substring(0, 2)) +
    //       int.parse(map['pushup'].substring(2, 4));
    // }
    // if (map['situp'] != null) {
    //   tempholder += int.parse(map['situp'].substring(0, 2)) +
    //       int.parse(map['situp'].substring(2, 4));
    // }
    // amount = tempholder;
    amount = map['volume'];
  }

  @override
  String toString() => "Record<$date:$amount>";
}
