import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/forums.dart';
import 'package:jamal_v1/widgets/features.dart';

import 'home_page.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _titleField = TextEditingController();
  TextEditingController _bodyField = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Posted on forums!'),
          // content: SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       Text('Back to homescreen'),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            TextButton(
              child: Text('Back to forums'),
              onPressed: () {
                print('Posted on forums');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForumsPage(),
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
                        "Create a post",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        child: TextFormField(
                          controller: _titleField,
                          decoration: InputDecoration(
                            labelText: "Post title",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 0.8,
                        child: TextFormField(
                          controller: _bodyField,
                          decoration: InputDecoration(
                            labelText: "Content",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        // TODO log to db, pop out, move back to homescreen
                        onPressed: () {
                          _showMyDialog();
                        },
                        child: Text("Post"),
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
