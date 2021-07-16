import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/model/bmi.dart';
import 'package:jamal_v1/widgets/navigation_menu.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  String urlImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  List<charts.Series<BMI, String>> _seriesBarData;
  List<BMI> mydata;
  _generateData(mydata) {
    _seriesBarData = [];
    // _seriesBarData = List<charts.Series<BMI, String>>();
    _seriesBarData.add(
      charts.Series(
        domainFn: (BMI bmi, _) => bmi.weight.toString(),
        measureFn: (BMI bmi, _) => bmi.height,
        // colorFn: (BMI bmi, _) =>
        //     charts.ColorUtil.fromDartColor(Color(int.parse(bmi.colorVal))),
        id: 'BMI',
        data: mydata,
        labelAccessorFn: (BMI row, _) => "${row.weight}",
      ),
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
                    return _buildBody(context);
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
                              child: Text(
                                  "Welcome back, ${document.data()['name']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                              //Text( "Price: ${getValue(document.id, document.data()['Amount'])}"),
                            ),
                          ],
                        ));
                      }).toList(),
                    );
                  }))));

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('sales').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<BMI> sales = snapshot.data.docs
              // documents
              .map((documentSnapshot) => BMI.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<BMI> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Sales by Year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 2),
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
