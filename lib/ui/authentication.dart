import 'package:flutter/material.dart';
import 'package:jamal_v1/net/auth.dart';
import 'package:jamal_v1/ui/tempo.dart';
import 'registration.dart';
import 'home_page.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  //for password field
  bool obscure = true;
  IconData passIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _emailField,
                    validator: (value) {
                      return value.isNotEmpty
                          ? (value.contains('@') ? null : 'Invalid Email')
                          : "Email cannot be empty";
                    },
                    decoration: InputDecoration(
                      hintText: "something@email.com",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    obscureText: obscure,
                    style: TextStyle(color: Colors.white),
                    controller: _passwordField,
                    validator: (value) {
                      return value.isNotEmpty
                          ? null
                          : "Password cannot be empty";
                    },
                    decoration: InputDecoration(
                      hintText: "password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
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
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registration(),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      _formkey.currentState.validate();
                      print(_emailField.text);
                      Auth auth = Auth();
                      bool shouldNavigate = await auth.login(
                          _emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      Auth auth = Auth();
                      bool shouldNavigate = await auth.anon();
                      if (shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: Text("Anon Login"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMIHomePage(),
                        ),
                      );
                    },
                    child: Text("testing page"),
                  ),
                )
              ],
            )),
      ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height / 35),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.4,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: MaterialButton(
//                   onPressed: () async {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Registration(),
//                       ),
//                     );
//                   },
//                   child: Text("Register"),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height / 35),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.4,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: MaterialButton(
//                   onPressed: () async {
//                     print(_emailField.text.toString());
//                     Auth auth = Auth();
//                     bool shouldNavigate =
//                         await auth.login(_emailField.text, _passwordField.text);
//                     if (shouldNavigate) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomePage(),
//                         ),
//                       );
//                     }
//                   },
//                   child: Text("Login"),
//                 ),
//               ),
      // SizedBox(height: MediaQuery.of(context).size.height / 35),
      // Container(
      //   width: MediaQuery.of(context).size.width / 1.4,
      //   height: 45,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //     color: Colors.white,
      //   ),
      //   child: MaterialButton(
      //     onPressed: () async {
      //       Auth auth = Auth();
      //       bool shouldNavigate = await auth.anon();
      //       if (shouldNavigate) {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => HomePage(),
      //           ),
      //         );
      //       }
      //     },
      //     child: Text("Anon Login"),
      //   ),
      // ),
      // SizedBox(height: MediaQuery.of(context).size.height / 35),
      // Container(
      //   width: MediaQuery.of(context).size.width / 1.4,
      //   height: 45,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //     color: Colors.white,
      //   ),
      //   child: MaterialButton(
      //     onPressed: () {},
      //     child: Text("testing page"),
      //   ),
      // )
    );
  }
}
