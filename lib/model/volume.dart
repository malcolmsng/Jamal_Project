import 'package:cloud_firestore/cloud_firestore.dart';

class Volume {
  String date;
  int amount;
  double value;

  Volume(this.date, this.amount);

  // Volume.fromMap(Map<String, dynamic> map)
  //     : assert(map['date'] != null),
  //       // assert(map['weight'] != null),
  //       date = map['date'],
  //       //weight = map['weight'],
  //       value = map['weight'] * 10000 / (map['height'] * map['height']);

  @override
  String toString() => "Record<$date:$amount>";
}
