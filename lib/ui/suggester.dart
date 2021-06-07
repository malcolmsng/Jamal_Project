import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/suggested_workouts.dart';
import 'package:jamal_v1/widgets/equipment_checkbox.dart';
import 'package:jamal_v1/widgets/fitness_checkbox.dart';

class Suggester extends StatefulWidget {
  @override
  _SuggesterState createState() => _SuggesterState();
}

class _SuggesterState extends State<Suggester> {
  //user's available time
  TextEditingController _availableTime = TextEditingController();

  //list of all equipment the user can select
  List<Equipment> equipment;
  List<FitnessLevel> fitnesslevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: 70,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        width: 350,
                        height: 60,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(0, 0, 123, 0),
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            EquipmentCheckbox.showEquipment(context);
                          },
                          child: Text('Select Available Equipment',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ))),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        width: 350,
                        height: 60,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.fromLTRB(0, 0, 170, 0)),
                          onPressed: () {
                            FitnessCheckbox.showFitness(context);
                          },
                          child: Text('Select Fitness Level',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //available time input
                    Container(
                      width: 350,
                      height: 60,
                      color: Colors.white,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          controller: _availableTime,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(),
                            labelText: 'Input Available Time',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )),
                    ),

                    SizedBox(
                      height: 60,
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
