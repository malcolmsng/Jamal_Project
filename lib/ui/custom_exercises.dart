import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/util/intermediate_exercise_constants.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:smart_select/smart_select.dart';

import 'home_page.dart';

class CustomExercisesPage extends StatefulWidget {
  @override
  _CustomExercisesPageState createState() => _CustomExercisesPageState();
}

class _CustomExercisesPageState extends State<CustomExercisesPage> {
  final _formkey = GlobalKey<FormState>();
  String uid = FirebaseAuth.instance.currentUser.uid;
  TextEditingController _setsField = TextEditingController();
  TextEditingController _repsField = TextEditingController();
  List<ex.Exercise> availableExercises = intermediateExercises;

  List<List<String>> currentWorkoutList = [];

  // List<String> selectedValues = [];
  List<int> top = <int>[];
  List<int> bottom = <int>[0];
  List<String> selectedValues = ["Added exercises"];
  String selectedValue = "Initial value";
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Pushup', title: 'Pushup'),
    S2Choice<String>(value: 'Situp', title: 'Situp'),
    S2Choice<String>(value: 'Squat', title: 'Squat'),
  ];

  // pop out box for users to add exercises
  Future<void> addExercisesDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(children: [
                  SmartSelect<String>.single(
                      title: "",
                      value: selectedValue,
                      choiceItems: options,
                      onChange: (state) =>
                          setState(() => selectedValue = state.value)),
                  Container(
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return value.isNotEmpty
                            ? null
                            : "No. of sets cannot be empty";
                      },
                      controller: _setsField,
                      decoration: InputDecoration(
                        labelText: "No. of sets",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        return value.isNotEmpty
                            ? null
                            : "No. of reps cannot be empty";
                      },
                      controller: _repsField,
                      decoration: InputDecoration(
                        labelText: "No. of reps",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            actions: [
              MaterialButton(
                child: Text('Add exercise'),
                onPressed: () async {
                  _formkey.currentState.validate();
                  print('Confirmed');
                  print(selectedValue);
                  print(_setsField.text);
                  print(_repsField.text);
                  List<String> toAdd = [
                    selectedValue.toLowerCase(),
                    _setsField.text.length < 2
                        ? "0" + _setsField.text
                        : _setsField.text,
                    _repsField.text.length < 2
                        ? "0" + _repsField.text
                        : _repsField.text,
                  ];
                  currentWorkoutList.add(toAdd);
                  print(currentWorkoutList);
                  selectedValues.add(selectedValue);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  // pop out box when user presses "Finished workout"
  Future<void> finishedWorkoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Workout completed!'),
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

  // main body of page
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await addExercisesDialog();
          setState(() {
            // top.add(-top.length - 1);
            bottom.add(bottom.length);
          });
        },
      ),
      appBar: AppBar(),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Add Custom Exercise',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue[200 + bottom[index] % 4 * 100],
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  alignment: Alignment.center,
                  height: 100,
                  child: Column(children: [
                    Text(selectedValues[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Sets: ${_setsField.text}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Reps: ${_repsField.text}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ])
                  ]),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              child: Text('End Workout'),
              onPressed: () async {
                finishedWorkoutDialog();
                await DatabaseService(uid: uid)
                    .addWorkoutList(currentWorkoutList);
              },
            )
          ],
        ),
      ),
    );
  }
}

// SliverList(
//   delegate: SliverChildBuilderDelegate(
//     (BuildContext context, int index) {
//       return Container(
//         alignment: Alignment.center,
//         color: Colors.blue[200 + top[index] % 4 * 100],
//         height: 100 + top[index] % 4 * 20.0,
//         child: Text('Item: ${top[index]}'),
//       );
//     },
//     childCount: top.length,
//   ),
// ),
