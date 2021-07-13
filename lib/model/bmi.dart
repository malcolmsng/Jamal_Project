class BMI {
  final int height;
  final int weight;

  BMI(this.height, this.weight);

  BMI.fromMap(Map<String, dynamic> map)
      : assert(map['height'] != null),
        assert(map['weight'] != null),
        height = map['height'],
        weight = map['weight'];

  @override
  String toString() => "Record<$height:$weight>";
}
