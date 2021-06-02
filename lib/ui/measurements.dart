import 'package:flutter/material.dart';
import 'package:jamal_v1/widgets/features.dart';

import 'home_page.dart';

class AddMeasurements extends StatefulWidget {
  @override
  _AddMeasurementsState createState() => _AddMeasurementsState();
}

class _AddMeasurementsState extends State<AddMeasurements> {
  TextEditingController _heightField = TextEditingController();
  TextEditingController _weightField = TextEditingController();
  TextEditingController _neckField = TextEditingController();
  TextEditingController _waistField = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Measurements added!'),
          // content: SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       Text('Back to homescreen'),
          //     ],
          //   ),
          // ),
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
      bottomNavigationBar: BottomFeaturesBar(),
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
                        "Input your measurements below.\nMeasurements are taken in kg/cm.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 80),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _heightField,
                          decoration: InputDecoration(
                            labelText: "Height",
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
                            labelText: "Weight",
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
                          controller: _neckField,
                          decoration: InputDecoration(
                            labelText: "Neck Circumference",
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
                          controller: _waistField,
                          decoration: InputDecoration(
                            labelText: "Waist Circumference",
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
                        // TODO log to db, pop out, move back to homescreen
                        onPressed: () {
                          _showMyDialog();
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
