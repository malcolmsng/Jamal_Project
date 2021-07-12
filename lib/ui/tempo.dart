import 'package:flutter/material.dart';

class CalendarChooser extends StatefulWidget {
  @override
  _CalendarChooserState createState() => _CalendarChooserState();
}

class _CalendarChooserState extends State<CalendarChooser> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(currentDate.toString()),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        print(currentDate.toString().substring(0, 10));
      });
  }
}
