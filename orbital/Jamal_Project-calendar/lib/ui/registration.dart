import 'package:flutter/material.dart';
import 'package:jamal_v1/net/auth.dart';
import 'package:jamal_v1/ui/authentication.dart';
import 'package:jamal_v1/ui/home_page.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/util/enum_methods.dart';
import 'package:smart_select/smart_select.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String avatarChoice = '1';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: '1', title: '1'),
    S2Choice<String>(value: '2', title: '2'),
    S2Choice<String>(value: '3', title: '3'),
    S2Choice<String>(value: '4', title: '4'),
    S2Choice<String>(value: '5', title: '5'),
    S2Choice<String>(value: '6', title: '6'),
    S2Choice<String>(value: '7', title: '7'),
    S2Choice<String>(value: '8', title: '8'),
    S2Choice<String>(value: '9', title: '9'),
  ];

  List<FitnessLevel> selectedFitnessLevel = [];

  List<MultiSelectItem> fitnessLevel = FitnessLevel.values
      .map((e) => MultiSelectItem<FitnessLevel>(e, Enums.enumToString(e)))
      .toList();
  final _formkey = GlobalKey<FormState>();
  final _multiformkey = GlobalKey<FormFieldState>();

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _nameField = TextEditingController();
  TextEditingController _ageField = TextEditingController();
  TextEditingController _heightField = TextEditingController();
  TextEditingController _weightField = TextEditingController();
  TextEditingController _bodyFatField = TextEditingController();

  //for password field
  bool obscure = true;
  IconData passIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset("assets/bg.jpg"),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authentication(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.black,
              ),
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.1,
                        ),
                        Text(
                          // insert user's name here
                          "Registration",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Fill in the fields below.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Choose an avatar!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/avatars/avatar1.png",
                                    width: 100),
                                Text("1"),
                                Image.asset("assets/avatars/avatar4.png",
                                    width: 100),
                                Text("4"),
                                Image.asset("assets/avatars/avatar7.png",
                                    width: 100),
                                Text("7"),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/avatars/avatar2.png",
                                    width: 100),
                                Text("2"),
                                Image.asset("assets/avatars/avatar5.png",
                                    width: 100),
                                Text("5"),
                                Image.asset("assets/avatars/avatar8.png",
                                    width: 100),
                                Text("8"),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/avatars/avatar3.png",
                                    width: 100),
                                Text("3"),
                                Image.asset("assets/avatars/avatar6.png",
                                    width: 100),
                                Text("6"),
                                Image.asset("assets/avatars/avatar9.png",
                                    width: 100),
                                Text("9"),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          child: SmartSelect<String>.single(
                              title: 'Select a number',
                              value: avatarChoice,
                              choiceItems: options,
                              onChange: (state) =>
                                  setState(() => avatarChoice = state.value)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? (value.contains('@')
                                      ? null
                                      : 'Invalid Email')
                                  : "Email cannot be empty";
                            },
                            controller: _emailField,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            obscureText: obscure,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? (value.length < 8 || value.length > 16
                                      ? "Password must be between 8 - 16 characters"
                                      : (double.tryParse(value) == null
                                          ? "Password must contain numbers"
                                          : null))
                                  : "Password cannot be empty";
                            },
                            controller: _passwordField,
                            decoration: InputDecoration(
                              helperText:
                                  "Password must contain numbers and be between 8 - 16 characters",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                    passIcon = obscure
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                  });
                                },
                                icon: Icon(passIcon),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: _nameField,
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _ageField,
                            decoration: InputDecoration(
                              labelText: "Age",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _heightField,
                            decoration: InputDecoration(
                              labelText: "Height(cm)",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _weightField,
                            decoration: InputDecoration(
                              labelText: "Weight(kg)",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _bodyFatField,
                            decoration: InputDecoration(
                              labelText: "Body Fat %",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: "Fitness Level",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        MultiSelectChipField<FitnessLevel>(
                          items: fitnessLevel,
                          key: _multiformkey,
                          title: Text('Select Fitness Level'),
                          headerColor: Colors.transparent,
                          decoration: BoxDecoration(color: Colors.transparent),
                          textStyle: TextStyle(
                            color: Colors.black,
                          ),
                          chipColor: Colors.white,
                          validator: (values) {
                            return values.length > 1
                                ? 'You can only select one fitness level'
                                : values.length < 1
                                    ? 'Select a fitness level'
                                    : '';
                          },
                          showHeader: false,
                          onTap: (values) {
                            selectedFitnessLevel = values;
                            print(selectedFitnessLevel);
                            _multiformkey.currentState.validate();
                          },
                        ),
                        SizedBox(height: 40),
                        MaterialButton(
                          onPressed: () async {
                            _formkey.currentState.validate();
                            Auth auth = Auth();
                            bool shouldNavigate = await auth.register(
                              avatarChoice,
                              _emailField.text,
                              _passwordField.text,
                              _nameField.text,
                              _ageField.text,
                              _heightField.text,
                              _weightField.text,
                              _bodyFatField.text,
                              Enums.enumToString(selectedFitnessLevel[0]),
                            );
                            if (shouldNavigate) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          },
                          child: Text("Proceed"),
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(height: 40),
                      ],
                    ))))
          ],
        ),
      ),
    );
  }
}
