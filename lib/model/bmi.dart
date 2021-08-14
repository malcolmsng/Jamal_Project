class BMI {
  final int height;
  final int weight;
  DateTime date;
  double value;

  BMI(this.height, this.weight, this.date);

  BMI.fromMap(Map<String, dynamic> map)
      : assert(map['height'] != null),
        assert(map['weight'] != null),
        height = map['height'],
        weight = map['weight'],
        value = map['weight'] * 10000 / (map['height'] * map['height']),
        date = DateTime(2021, int.parse(map['date'].substring(0, 2)),
            int.parse(map['date'].substring(3, 5)));

  @override
  String toString() => "Record<$height:$weight>";
}
