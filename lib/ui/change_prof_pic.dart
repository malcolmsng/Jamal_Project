import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/net/database.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

class ChangeProfilePic extends StatefulWidget {
  @override
  _ChangeProfilePicState createState() => _ChangeProfilePicState();
}

class _ChangeProfilePicState extends State<ChangeProfilePic> {
  String uid = FirebaseAuth.instance.currentUser.uid;

  TextEditingController _choiceField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        controller: _choiceField,
                        decoration: InputDecoration(
                          labelText: "Input your choice here",
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
                        await DatabaseService(uid: uid)
                            .updateProfilePicture(_choiceField.text);
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
