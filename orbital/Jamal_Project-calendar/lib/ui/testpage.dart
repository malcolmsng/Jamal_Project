import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class FlaskTest extends StatefulWidget {
  const FlaskTest({Key key}) : super(key: key);

  @override
  _FlaskTestState createState() => _FlaskTestState();
}

class _FlaskTestState extends State<FlaskTest> {
  String name = ""; //user's response will be assigned to this variable
  String finalResponse =
      ""; //will be displayed on the screen once we get the data from the server
  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form
  final url = Uri.parse('https://malcolmsng99.pythonanywhere.com/name');
  //function to validate and save user form
  Future<void> _savingData() async {
    final validation = _formkey.currentState.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Container(
              width: 350,
              child: Form(
                key: _formkey,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your name: ',
                  ),
                  onSaved: (value) {
                    name =
                        value; //getting data from the user form and assigning it to name
                  },
                ),
              ),
            ),

            TextButton(
              onPressed: () async {
                //validating the form and saving it
                _savingData();

                //url to send the post request to

                //sending a post request to the url
                final response =
                    await http.post(url, body: json.encode({'name': name}));
                print('posted');
              },
              child: Text('SEND'),
            ),

            TextButton(
              onPressed: () async {
                //url to send the get request to

                //getting data from the python server script and assigning it to response
                final response = await http.get(url);
                print(response.body);

                //converting the fetched data from json to key value pair that can be displayed on the screen
                final decoded =
                    json.decode(response.body) as Map<String, dynamic>;

                //changing the UI be reassigning the fetched data to final response
                setState(() {
                  finalResponse = decoded['name'];
                });
              },
              child: Text('GET'),
            ),

            //displays the data on the screen
            Text(
              finalResponse,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response;
}
