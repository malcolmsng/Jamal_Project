import 'package:cloud_firestore/cloud_firestore.dart';

class Volume {
  String date;
  int amount;
  double value;

  Volume(date, amount) {
    this.date = date;
    this.amount = amount;
  }

  @override
  String toString() => "Record<$date:$amount>";
}
