import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Equipment {
  final int id;
  final String name;

  Equipment({this.id, this.name});
}

class EquipmentCheckbox {
  static List<Equipment> selectedList = [];

  static List<MultiSelectItem<Equipment>> equipment = [
    Equipment(id: 1, name: 'No equipment'),
    Equipment(id: 2, name: 'Barbell'),
    Equipment(id: 3, name: 'Squat Rack'),
    Equipment(id: 4, name: 'Dumbbell'),
    Equipment(id: 5, name: 'Kettlebell'),
    Equipment(id: 6, name: 'Pullup Bar'),
  ].map((e) => MultiSelectItem<Equipment>(e, e.name)).toList();

  static void showEquipment(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return MultiSelectDialog<Equipment>(
            items: equipment,
            initialValue: [],
            title: Text('Available Equipment'),
            onConfirm: (results) {
              selectedList = results;
              print(selectedList.toString());
            },
          );
        });
  }
}
