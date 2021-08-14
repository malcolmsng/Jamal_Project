import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/model/bmi.dart';
import 'package:jamal_v1/model/body_fat.dart';
import 'package:jamal_v1/model/volume.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // generate username and profile picture
  String uid = FirebaseAuth.instance.currentUser.uid;
  List<charts.Series> seriesList;
  bool animate;

// generate data for Volume graph
  List<charts.Series<VolumePerWorkout, DateTime>> _seriesVolumeData;
  List<VolumePerWorkout> myVolumedata;
  _generateVolumeData(myVolumedata) {
    _seriesVolumeData = [];
    // for (BMI i in mydata) {
    //   print(i.date);
    //   print(i.value);
    // }
    // _seriesBarData = List<charts.Series<BMI, String>>();
    _seriesVolumeData.add(
      charts.Series(
        domainFn: (VolumePerWorkout volume, _) => volume.date,
        measureFn: (VolumePerWorkout volume, _) => volume.amount,
        // colorFn: (BMI bmi, _) =>
        //     charts.ColorUtil.fromDartColor(Color(int.parse(bmi.colorVal))),
        id: 'Volume',
        data: myVolumedata,
        // labelAccessorFn: (BMI row, _) => "${row.weight}",
      ),
    );
  }

  // generate data for BMI graph
  List<charts.Series<BMI, DateTime>> _seriesBarData;
  List<BMI> myBMIdata;
  _generateBMIData(myBMIdata) {
    _seriesBarData = [];

    _seriesBarData.add(
      charts.Series(
        domainFn: (BMI bmi, _) => bmi.date,
        measureFn: (BMI bmi, _) => bmi.value,
        id: 'BMI',
        data: myBMIdata,
      ),
    );
  }

// generate data for body fat graph
  List<charts.Series<BodyFatPercentage, DateTime>> _seriesBodyFatData;
  List<BodyFatPercentage> myBodyFatData;
  _generateBodyFatData(myBodyFatData) {
    _seriesBodyFatData = [];

    _seriesBodyFatData.add(
      charts.Series(
        domainFn: (BodyFatPercentage bodyFat, _) => bodyFat.date,
        measureFn: (BodyFatPercentage bodyFat, _) => bodyFat.percentage,
        id: 'Body Fat',
        data: myBodyFatData,
      ),
    );
  }

  // Definition of BMI
  Future<void> _whatIsBMIDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BMI'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'BMI is calculated by dividing the weight of a user (in kg) by the square of their height (in m).'),
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  // Definition of volume
  Future<void> _whatIsVolumeDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Volume'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Volume is calculated by multiplying the number of sets with number of reps for each exercise in a workout. If weights are used, they are multiplied in as well (in kg).'),
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  // Definition of volume
  Future<void> _whatIsBodyFatDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Body Fat %'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Your body fat percetange can be found using most electronic weighing scale. The ideal amount is 25% and below for men, and 31% and below for women.'),
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    //var user = Provider.of<User>(context);

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset("assets/bg.jpg"),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              buildUserInfoSection(context),
              SliverList(
                // itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildBody(context, index);
                    // return Container(
                    //   height: 500,
                    //   alignment: Alignment.center,
                    //   color: Colors.lightBlue[100 * (index % 9)],
                    //   child: Text('List Item $index'),
                    // );
                  },
                  childCount: 3,
                ),
              )
              // SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //   (BuildContext context, int index) {
              //     print(index);
              //     return buildProgressGraph(index);
              //   },
              //   childCount: 3,
              // )),
            ],
          ),
        ],
      ),
    );
  }

  // build "Welcome back" portion
  SliverAppBar buildUserInfoSection(BuildContext context) => SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      stretch: true,
      // title: Text('Profile'),
      centerTitle: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Center(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('particulars')
                      //.doc(FirebaseAuth.instance.currentUser.uid)
                      // .collection('Coins')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: snapshot.data.docs
                          .where((document) => document.id == uid)
                          .map((document) {
                        // print(document.id);
                        // if (document.id == uid) {
                        return Container(
                            child: Column(
                          children: [
                            SizedBox(height: 50),
                            ClipOval(
                              //                     SizedBox(
                              //   child: Image.asset("assets/bg.jpg"),
                              // ),
                              child: Material(
                                color: Colors.transparent,
                                child: Image.asset(
                                    "assets/avatars/avatar${document.data()['avatarChoice']}.png",
                                    width: 128),

                                // Ink.image(
                                //     image: NetworkImage(urlImage),
                                //     fit: BoxFit.cover,
                                //     width: 128,
                                //     height: 128,
                                //     child: InkWell(onTap: () {})),
                              ),
                            ),
                            SizedBox(height: 24),
                            FittedBox(
                              fit: BoxFit.contain,

                              child: Text(
                                "${document.data()['name']}",
                                // style: Theme.of(context).textTheme.headline1
                              ),

                              //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                            ),
                          ],
                        ));
                      }).toList(),
                    );
                  }))));

  // general function to retrieve data
  Widget _buildBody(BuildContext context, int index) {
    // BUILD VOLUME GRAPH
    if (index == 0) {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('particulars')
            .doc(uid)
            .collection('workouts')
            .snapshots(),
        // stream: FirebaseFirestore.instance.collection('sales').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            List<VolumePerWorkout> totalVolumePerWorkout = snapshot.data.docs
                .map((documentSnapshot) =>
                    VolumePerWorkout.fromMap(documentSnapshot.data()))
                .toList();
            //hardcode values for now
            // List<VolumePerWorkout> totalVolumePerWorkout = [
            //   VolumePerWorkout("07/07", 290),
            //   VolumePerWorkout("08/07", 320),
            //   VolumePerWorkout("09/07", 350),
            //   VolumePerWorkout("10/07", 390),
            //   VolumePerWorkout("11/07", 420),
            //   VolumePerWorkout("12/07", 410),
            //   VolumePerWorkout("13/07", 440)
            // ];
            return _buildVolumeChart(context, totalVolumePerWorkout);
          }
        },
      );
      // BUILD BMI GRAPH
    } else if (index == 1) {
      print(index);
      //return Text("holder");
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('particulars')
            .doc(uid)
            .collection('measurements')
            .snapshots(),
        // stream: FirebaseFirestore.instance.collection('sales').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            List<BMI> databaseData = snapshot.data.docs
                // documents
                .map((documentSnapshot) => BMI.fromMap(documentSnapshot.data()))
                .toList();
            return _buildBMIChart(context, databaseData);
          }
        },
      );
      // BUILD BODY FAT GRAPH
    } else if (index == 2) {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('particulars')
            .doc(uid)
            .collection('measurements')
            .snapshots(),
        // stream: FirebaseFirestore.instance.collection('sales').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            List<BodyFatPercentage> totalBodyFatPercentage = snapshot.data.docs
                .map((documentSnapshot) =>
                    BodyFatPercentage.fromMap(documentSnapshot.data()))
                .toList();
            //hardcode values for now
            // List<BodyFatPercentage> totalBodyFatPercentage = [
            //   new BodyFatPercentage(new DateTime(2017, 9, 19), 5),
            //   new BodyFatPercentage(new DateTime(2017, 9, 26), 25),
            //   new BodyFatPercentage(new DateTime(2017, 10, 3), 100),
            //   new BodyFatPercentage(new DateTime(2017, 10, 10), 75),
            // ];
            return _buildBodyFatChart(context, totalBodyFatPercentage);
          }
        },
      );
    } else {
      return Text("error: too many graphs to plot");
    }
  }

  // function to build BMI graph
  Widget _buildBMIChart(BuildContext context, List<BMI> saledata) {
    myBMIdata = saledata;
    _generateBMIData(myBMIdata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
                  'BMI changes over the past 7 days',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                IconButton(
                    onPressed: () async {
                      _whatIsBMIDialog();
                    },
                    icon: new Icon(Icons.help_outline))
              ]),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  // legend
                  // behaviors: [
                  //   new charts.DatumLegend(
                  //     entryTextStyle: charts.TextStyleSpec(
                  //         color: charts.MaterialPalette.purple.shadeDefault,
                  //         fontFamily: 'Georgia',
                  //         fontSize: 18),
                  //   )
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function to build volume graph
  Widget _buildVolumeChart(BuildContext context, List<VolumePerWorkout> data) {
    myVolumedata = data;
    _generateVolumeData(myVolumedata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
                  'Total volume for the past 7 workouts',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                IconButton(
                    onPressed: () async {
                      _whatIsVolumeDialog();
                    },
                    icon: new Icon(Icons.help_outline))
              ]),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  _seriesVolumeData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  // legend
                  // behaviors: [
                  //   new charts.DatumLegend(
                  //     entryTextStyle: charts.TextStyleSpec(
                  //         color: charts.MaterialPalette.purple.shadeDefault,
                  //         fontFamily: 'Georgia',
                  //         fontSize: 18),
                  //   )
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function to build body fat graph
  Widget _buildBodyFatChart(
      BuildContext context, List<BodyFatPercentage> data) {
    myBodyFatData = data;
    _generateBodyFatData(myBodyFatData);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
                  'Changes in body fat for the past 7 workouts',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                IconButton(
                    onPressed: () async {
                      _whatIsBodyFatDialog();
                    },
                    icon: new Icon(Icons.help_outline))
              ]),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  _seriesBodyFatData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
  //       flexibleSpace: FlexibleSpaceBar(background: LineChartWidget()),
  //       expandedHeight: MediaQuery.of(context).size.height * 0.5,
  //       stretch: true,
  //       title: Text('Home Page'),
  //       centerTitle: true,
  //       pinned: true,
  //       /*leading: ElevatedButton.icon(
  //         onPressed: () {
  //           NavigationDrawerWidget().build(context);
  //         },
  //         icon: Icon(Icons.menu),
  //         label: Text('')),
  //     actions: [
  //       Icon(Icons.person, size: 28),
  //       SizedBox(width: 12),
  //     ],*/
  //     );

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
