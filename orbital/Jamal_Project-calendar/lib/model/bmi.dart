class BMI {
  final int height;
  final int weight;
  final String date;
  double value;

  BMI(this.height, this.weight, this.date);

  BMI.fromMap(Map<String, dynamic> map)
      : assert(map['height'] != null),
        assert(map['weight'] != null),
        height = map['height'],
        weight = map['weight'],
        value = map['weight'] * 10000 / (map['height'] * map['height']),
        date = map['date'];

  @override
  String toString() => "Record<$height:$weight>";
}
