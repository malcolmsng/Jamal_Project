import 'package:flutter/material.dart';

class FlaskTest extends StatefulWidget {
  const FlaskTest({Key key}) : super(key: key);

  @override
  _FlaskTestState createState() => _FlaskTestState();
}

class _FlaskTestState extends State<FlaskTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('hi'),
      ),
    );
  }
}
