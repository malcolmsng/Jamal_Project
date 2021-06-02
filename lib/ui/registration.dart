import 'package:flutter/material.dart';
import 'package:jamal_v1/net/auth.dart';
import 'package:jamal_v1/ui/home_page.dart';

class Registraton extends StatefulWidget {
  @override
  _RegistratonState createState() => _RegistratonState();
}

class _RegistratonState extends State<Registraton> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _nameField = TextEditingController();
  TextEditingController _ageField = TextEditingController();
  TextEditingController _heightField = TextEditingController();
  TextEditingController _weightField = TextEditingController();
  TextEditingController _fitnessField = TextEditingController();
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
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Text(
                          // insert usen's name here
                          "Registration",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Fill in the fields below truthfully",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 80),
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
                            controller: _fitnessField,
                            decoration: InputDecoration(
                              labelText: "Fitness Level",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 80),
                        MaterialButton(
                          onPressed: () async {
                            _formkey.currentState.validate();
                            Auth auth = Auth();
                            bool shouldNavigate = await auth.register(
                                _emailField.toString(),
                                _passwordField.toString());
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
                      ],
                    ))))
          ],
        ),
      ),
    );
  }
}
