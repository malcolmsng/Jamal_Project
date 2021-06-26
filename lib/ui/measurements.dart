import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

import 'home_page.dart';

class AddMeasurementsPage extends StatefulWidget {
  @override
  _AddMeasurementsPageState createState() => _AddMeasurementsPageState();
}

class _AddMeasurementsPageState extends State<AddMeasurementsPage> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  TextEditingController _heightField = TextEditingController();
  TextEditingController _weightField = TextEditingController();
  TextEditingController _bodyFatField = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Measurements added!'),
          actions: <Widget>[
            TextButton(
              child: Text('Back to dashboard'),
              onPressed: () {
                print('Confirmed');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset("assets/bg.jpg"),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      Text(
                        // insert usen's name here
                        "Health tracker",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Input measurements below.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _heightField,
                          decoration: InputDecoration(
                            labelText: "Height (cm)",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _weightField,
                          decoration: InputDecoration(
                            labelText: "Weight (kg)",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _bodyFatField,
                          decoration: InputDecoration(
                            labelText: "Body Fat Percentage (%)",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          _showMyDialog();
                          await DatabaseService(uid: uid).addMeasurements(
                              _heightField.text,
                              _weightField.text,
                              _bodyFatField.text);
                        },
                        child: Text("Log Measurements"),
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}

// class Metric {
//   final TextEditingController input;
//   final String hint;
//   final String label;

//   Metric(this.input, this.hint, this.label);
// }
