import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/model/workout.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:jamal_v1/ui/suggested_workouts.dart';
import 'package:jamal_v1/model/equipment.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/util/enum_methods.dart';

class Suggester extends StatefulWidget {
  @override
  _SuggesterState createState() => _SuggesterState();
}

class _SuggesterState extends State<Suggester> {
  //user's available time
  final _multiformkey = GlobalKey<FormFieldState>();
  List<MultiSelectItem> equipment = Equipment.values
      .map((e) => MultiSelectItem<Equipment>(e, getEquipment(e)))
      .toList();

  List<Equipment> selectedEquipment = [];

  String uid = FirebaseAuth.instance.currentUser.uid;

  //list of all equipment the user can select

  FitnessLevel userFitness = FitnessLevel.Beginner;

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
                        "Select Available Equipment ",
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
                      child: MultiSelectChipField<Equipment>(
                        items: equipment,
                        key: _multiformkey,
                        title: Text('Select Available Equipment'),
                        headerColor: Colors.transparent,
                        decoration: BoxDecoration(color: Colors.transparent),
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        chipColor: Colors.white,
                        validator: (values) {
                          return values.length < 1 ? 'Select at least one' : '';
                        },
                        showHeader: false,
                        onTap: (values) {
                          selectedEquipment = values;
                          print(Scrollable.of(context).position.pixels);

                          _multiformkey.currentState.validate();
                        },
                        scrollControl: (controller) {
                          scrollAnimation(controller);
                        },
                      ),
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
                    TextButton(
                        child: Text('nice'),
                        onPressed: () {
                          setState(() {
                            DatabaseService().getFitnessLevel(uid).then(
                                (value) => (userFitness =
                                    Enums.enumFromString<FitnessLevel>(
                                        value, FitnessLevel.values)));
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void scrollAnimation(ScrollController controller) {
  // when using more than one animation, use async/await
  Future.delayed(const Duration(milliseconds: 500), () async {
    await controller.animateTo(controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 5000), curve: Curves.linear);

    await controller.animateTo(controller.position.minScrollExtent,
        duration: Duration(milliseconds: 1250),
        curve: Curves.fastLinearToSlowEaseIn);
  });
}
