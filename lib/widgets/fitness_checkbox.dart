import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FitnessLevel {
  final int id;
  final String level;

  FitnessLevel({this.id, this.level});
}

class FitnessCheckbox {
  static List<FitnessLevel> selectedList = [];
  static List<MultiSelectItem<FitnessLevel>> fitnessLevels = [
    FitnessLevel(id: 1, level: 'Beginner'),
    FitnessLevel(id: 2, level: 'Intermediate'),
    FitnessLevel(id: 3, level: 'Advanced'),
  ].map((e) => MultiSelectItem<FitnessLevel>(e, e.level)).toList();

  static void showFitness(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog<FitnessLevel>(
            items: fitnessLevels,
            initialValue: [],
            title: Text('Fitness Levels'),
            onConfirm: (results) {},
          );
        });
  }
}
