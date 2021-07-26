import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/model/bmi.dart';
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
  String urlImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  // generate data for BMI graph
  List<charts.Series<BMI, String>> _seriesBarData;
  List<BMI> myBMIdata;
  _generateBMIData(myBMIdata) {
    _seriesBarData = [];
    // for (BMI i in mydata) {
    //   print(i.date);
    //   print(i.value);
    // }
    // _seriesBarData = List<charts.Series<BMI, String>>();
    _seriesBarData.add(
      charts.Series(
        domainFn: (BMI bmi, _) => bmi.date,
        measureFn: (BMI bmi, _) => bmi.value,
        // colorFn: (BMI bmi, _) =>
        //     charts.ColorUtil.fromDartColor(Color(int.parse(bmi.colorVal))),
        id: 'BMI',
        data: myBMIdata,
        // labelAccessorFn: (BMI row, _) => "${row.weight}",
      ),
    );
  }

  // generate data for Volume graph
  List<charts.Series<Volume, String>> _seriesVolumeData;
  List<Volume> myVolumedata;
  _generateVolumeData(myVolumedata) {
    _seriesVolumeData = [];
    // for (BMI i in mydata) {
    //   print(i.date);
    //   print(i.value);
    // }
    // _seriesBarData = List<charts.Series<BMI, String>>();
    _seriesVolumeData.add(
      charts.Series(
        domainFn: (Volume volume, _) => volume.date,
        measureFn: (Volume volume, _) => volume.amount,
        // colorFn: (BMI bmi, _) =>
        //     charts.ColorUtil.fromDartColor(Color(int.parse(bmi.colorVal))),
        id: 'BMI',
        data: myVolumedata,
        // labelAccessorFn: (BMI row, _) => "${row.weight}",
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
            Text(
                'BMI is calculated by dividing the weight of a user (in kg) by the square of their height (in m).'),
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
            Text(
                'Volume is calculated by multiplying the number of sets with number of reps for each exercise in a workout. If weights are used, they are multiplied in as well (in kg).'),
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
                              child: Material(
                                color: Colors.transparent,
                                child: Ink.image(
                                    image: NetworkImage(urlImage),
                                    fit: BoxFit.cover,
                                    width: 128,
                                    height: 128,
                                    child: InkWell(onTap: () {})),
                              ),
                            ),
                            SizedBox(height: 24),
                            FittedBox(
                              fit: BoxFit.contain,

                              child: Text("${document.data()['name']}",
                                  style: Theme.of(context).textTheme.headline1),

                              //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                            ),
                          ],
                        ));
                      }).toList(),
                    );
                  }))));

  // general function to retrieve data
  Widget _buildBody(BuildContext context, int index) {
    // BUILD BMI GRAPH
    if (index == 0) {
      print(index);
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
            List<BMI> sales = snapshot.data.docs
                // documents
                .map((documentSnapshot) => BMI.fromMap(documentSnapshot.data()))
                .toList();
            return _buildBMIChart(context, sales);
          }
        },
      );
      // BUILD VOLUME GRAPH
    } else if (index == 1) {
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
            //hardcode values for now
            List<Volume> totalVolume = [
              Volume("07/07", 290),
              Volume("08/07", 320),
              Volume("09/07", 350),
              Volume("10/07", 390),
              Volume("11/07", 420),
              Volume("12/07", 410),
              Volume("13/07", 440)
            ];
            // List<Volume> totalVolume = [];
            // snapshot.data.docs.forEach(x =>
            //   Map<String, dynamic> obj = doc.data;
            //   totalVolume.add(obj);
            // convert this Map to your custom object and add it to your list
            //);


            // List<Volume> totalVolume = snapshot.data.docs
            //     // documents
            //     .map((documentSnapshot) => Volume(documentSnapshot.data()))
            //     .toList();
            return _buildVolumeChart(context, totalVolume);
          }
        },
      );
      // BUILD LAST GRAPH
    } else if (index == 2) {
      return Text("temp");
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
                      fontSize: 18.0,
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
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function to build volume graph
  Widget _buildVolumeChart(BuildContext context, List<Volume> data) {
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
                      fontSize: 18.0,
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
                child: charts.BarChart(
                  _seriesVolumeData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 18),
                    )
                  ],
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
