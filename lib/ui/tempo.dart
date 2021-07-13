import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/model/bmi.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BMIHomePage extends StatefulWidget {
  @override
  _BMIHomePageState createState() {
    return _BMIHomePageState();
  }
}

class _BMIHomePageState extends State<BMIHomePage> {
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
    return Scaffold(
      appBar: AppBar(title: Text('BMI graph')),
      body: _buildBody(context),
      // Container(
      //   child: _buildBody(context),
      //   height: 300,
      // ),
    );
  }

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
        //height: 30,
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
}
