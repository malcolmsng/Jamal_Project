import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/custom_exercises.dart';
import 'package:jamal_v1/widgets/line_chart.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';

SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(background: LineChartWidget()),
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      stretch: true,
      title: Text('Home Page'),
      centerTitle: true,
      pinned: true,
      /*leading: ElevatedButton.icon(
          onPressed: () {
            NavigationDrawerWidget().build(context);
          },
          icon: Icon(Icons.menu),
          label: Text('')),
      actions: [
        Icon(Icons.person, size: 28),
        SizedBox(width: 12),
      ],*/
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    //var user = Provider.of<User>(context);

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomExercisesPage(),
            ),
          );
          print("button");
        },
        child: Icon(Icons.add),
      ),
      //bottomNavigationBar: BottomFeaturesBar(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildAppBar(context),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 150.0,
                  child: LineChartWidget(),
                  // Center(
                  //   child: Text('$index', textScaleFactor: 5),
                  // ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
  /*Stack(
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
                        // insert user's name here
                        "Welcome back, Jason",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Fitness sage",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 80),
                      SizedBox(
                        // width: screenSize.width * .6,
                        child: Text("Your weekly progress so far:",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // FutureBuilder(
                      //   future: Provider.of(context).auth.getCurrentUserID(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       return Text(
                      //         "${snapshot.data.age ?? 2000}",
                      //       );
                      //     } else {
                      //       return CircularProgressIndicator();
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   width: screenSize.width,
                      //   child: Image.asset("assets/progress.png"),
                      // ),
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Text(user.toString() ?? "no user found",
                              style: TextStyle(
                                fontSize: 20,
                              ))
                        ],
                      )
                    ],
                  ))))
        ],
      ),
    );
  }
*/
  // Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
  //     BuildContext context) async* {
  //   final uid = await Provider.of(context).auth.getCurrentUID();
  //   FirebaseAuth.instance.snapshots();
  // }
}
