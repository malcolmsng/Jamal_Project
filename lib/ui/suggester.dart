import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:jamal_v1/ui/suggested_workouts.dart';
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class Suggester extends StatefulWidget {
  @override
  _SuggesterState createState() => _SuggesterState();
}

class _SuggesterState extends State<Suggester> {
  //user's available time
  TextEditingController _availableTime = TextEditingController();
  List<String> selectedValues = [];

  //list of all equipment the user can select
  List<Equipment> equipment;
  List<FitnessLevel> fitnesslevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Workout Suggester'),
          centerTitle: true,
          //backgroundColor: Colors.black87,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                child: Image.asset("assets/bg.jpg"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(
                //   color: Colors.blueAccent,
                // ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Please provide the information below",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      margin: EdgeInsets.all(20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: MultiSelect(
                        autovalidate: false,
                        titleText: "Available Equipment",
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one or more option(s)';
                          }
                          return value;
                        },
                        errorText: 'Please select one or more option(s)',
                        dataSource: [
                          {
                            "display": "bench",
                            "value": "bench",
                          },
                          {
                            "display": "pull up bar",
                            "value": "pull up bar",
                          },
                          {
                            "display": "dumbbells",
                            "value": "dumbbells",
                          },
                          {
                            "display": "kettle bells",
                            "value": "kettle bells",
                          }
                        ],
                        textField: 'display',
                        valueField: 'value',
                        filterable: true,
                        required: true,
                        value: null,
                        change: (values) {
                          selectedValues = [values.toString()];
                          print(selectedValues);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        width: 350,
                        height: 60,
                      ),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          controller: _availableTime,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(),
                            labelText: 'Input Available Time (min)',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent),
                      child: Text('Get Suggestions!'),
                      onPressed: () {
                        print('Confirmed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuggestedWorkout(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
