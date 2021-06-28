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
        title: ChartTitle(text: "Height"),
        //legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
              name: 'Height',
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
        title: ChartTitle(text: "Weight"),
        //legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SalesData, double>(
              name: 'Weight',
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
  if (index == 0) {
    final List<SalesData> chartData = [
      SalesData(2, 7),
      SalesData(3, 7),
      SalesData(4, 5),
      SalesData(5, 6),
      SalesData(6, 6)
    ];
    return chartData;
  } else if (index == 1) {
    final List<SalesData> chartData = [
      SalesData(2, 168),
      SalesData(3, 169),
      SalesData(4, 169),
      SalesData(5, 169),
      SalesData(6, 168)
    ];
    return chartData;
  } else {
    final List<SalesData> chartData = [
      SalesData(2, 64),
      SalesData(3, 63),
      SalesData(4, 63),
      SalesData(5, 62),
      SalesData(6, 62)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.time, this.value);
  final double time;
  final double value;
}
