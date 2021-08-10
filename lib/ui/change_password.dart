import 'package:flutter/material.dart';
import 'package:jamal_v1/net/auth.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

import 'home_page.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _passwordField = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password updated!'),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      body: Stack(
        children: [
          // SizedBox(
          //   child: Image.asset("assets/bg.jpg"),
          // ),
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
                      "Input new password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        controller: _passwordField,
                        decoration: InputDecoration(
                          labelText: "New password",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print("here");
                        print(_passwordField.toString());
                        Auth auth = Auth();
                        bool shouldNavigate =
                            await auth.changePassword(_passwordField.text);
                        if (shouldNavigate) {
                          _showMyDialog();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      },
                      child: Text("Update"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
