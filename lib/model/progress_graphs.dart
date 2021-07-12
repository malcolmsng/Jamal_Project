import 'package:syncfusion_flutter_charts/charts.dart';

SfCartesianChart buildProgressGraph(int index) {
  if (index == 0) {
    return SfCartesianChart(
        title: ChartTitle(text: "Workouts done per week"),
        //legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
              // name: 'Sales',
              dataSource: getChartData(index),
              xValueMapper: (SalesData sales, _) => sales.time,
              yValueMapper: (SalesData sales, _) => sales.value,
              //dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis());
  } else if (index == 1) {
    return SfCartesianChart(
        title: ChartTitle(text: "Total volume per week (kg)"),
        //legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
              name: 'Total Volume',
              dataSource: getChartData(index),
              xValueMapper: (SalesData sales, _) => sales.time,
              yValueMapper: (SalesData sales, _) => sales.value,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis());
  } else {
    return SfCartesianChart(
        title: ChartTitle(text: "BMI"),
        //legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
              name: 'BMI',
              dataSource: getChartData(index),
              xValueMapper: (SalesData sales, _) => sales.time,
              yValueMapper: (SalesData sales, _) => sales.value,
              //dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis());
  }
}

List<SalesData> getChartData(int index) {
  // get workouts done for the past week
  if (index == 0) {
    final List<SalesData> chartData = [
      SalesData(2, 3),
      SalesData(2.25, 4),
      SalesData(2.5, 3),
      SalesData(2.75, 4),
      SalesData(3, 2),
      SalesData(3.25, 3),
      SalesData(3.5, 4),
      SalesData(3.75, 3),
      SalesData(4, 3),
      SalesData(4.25, 4),
      SalesData(4.5, 3),
      SalesData(4.75, 4),
      SalesData(5, 3),
      SalesData(5.25, 4),
      SalesData(5.5, 5),
      SalesData(5.75, 5)
    ];
    return chartData;
  } else if (index == 1) {
    final List<SalesData> chartData = [
      SalesData(2, 2688),
      SalesData(2.25, 2931),
      SalesData(2.5, 3233),
      SalesData(2.75, 3507),
      SalesData(3, 3829),
      SalesData(3.25, 4309),
      SalesData(3.5, 4631),
      SalesData(3.75, 4911),
      SalesData(4, 5235),
      SalesData(4.25, 5422),
      SalesData(4.5, 5689),
      SalesData(4.75, 5920),
      SalesData(5, 6192),
      SalesData(5.25, 6209),
      SalesData(5.5, 6431),
      SalesData(5.75, 6606)
    ];
    return chartData;
  } else {
    final List<SalesData> chartData = [
      SalesData(2, 27.2),
      SalesData(2.25, 27.0),
      SalesData(2.5, 26.7),
      SalesData(2.75, 26.4),
      SalesData(3, 26.2),
      SalesData(3.25, 25.9),
      SalesData(3.5, 25.7),
      SalesData(3.75, 25.4),
      SalesData(4, 25.2),
      SalesData(4.25, 24.9),
      SalesData(4.5, 24.7),
      SalesData(4.75, 24.4),
      SalesData(5, 24.0),
      SalesData(5.25, 23.7),
      SalesData(5.5, 23.6),
      SalesData(5.75, 23.5)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.time, this.value);
  final double time;
  final double value;
}
