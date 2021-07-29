class Enums {
  static T enumFromString<T>(String key, List<T> values) =>
      values.firstWhere((v) => key == enumToString(v), orElse: () => null);

  static String enumToString(Object o) => o.toString().split('.').last;
}
