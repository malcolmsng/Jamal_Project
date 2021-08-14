class BodyFatPercentage {
  DateTime date;
  int percentage;

  BodyFatPercentage(this.date, this.percentage);

  BodyFatPercentage.fromMap(Map<String, dynamic> map) {
    // assert(map['weight'] != null),
    date = DateTime(2021, int.parse(map['date'].substring(0, 2)),
        int.parse(map['date'].substring(3, 5)));
    percentage = map['bodyFat'];
  }

  @override
  String toString() => "Record<$date:$percentage>";
}
