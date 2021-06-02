import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/create_post.dart';
import 'package:jamal_v1/widgets/features.dart';

class ForumsPage extends StatefulWidget {
  @override
  _ForumsPageState createState() => _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {
  TextEditingController _searchField = TextEditingController();

  final List<OtherUser> usersOnForum = [
    OtherUser("ForumModerator", "23.1k", "Community FAQs"),
    OtherUser("user231", "12k", "My transformation over the last 3 years"),
    OtherUser("user93", "3.4", "I just did 100 push-ups everyday for a year"),
    OtherUser("user013", "204", "How do I do a pull-up?"),
    OtherUser("user561", "17", "What is the propoer form to do a deadlift?"),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomFeaturesBar(),
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
                        // insert usen's name here
                        "Jamal Community",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Text("Jason",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey,
                                )),
                            Text("Title: Fitness sage"),
                            Text("Points: 1470")
                          ],
                        ),
                        SizedBox(
                          width: screenSize.width * 0.25,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _searchField,
                            decoration: InputDecoration(
                              labelText: "Search in forum",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (final user in usersOnForum)
                              Card(
                                child: ListTile(
                                  title: Text(user.post),
                                  subtitle: Text(user.name +
                                      " (" +
                                      user.points +
                                      " points)"),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ))))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePost(),
                ));
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

class OtherUser {
  String name;
  String points;
  String post;

  OtherUser(String name, String points, String post) {
    this.name = name;
    this.points = points;
    this.post = post;
  }
}
