import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Page2> {
  late SelectionBehavior _selectionBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _selectionBehavior = SelectionBehavior(
        // Enables the selection
        enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.grey);
    _trackballBehavior = TrackballBehavior(
        // Enables the trackball
        enable: true,
        tooltipSettings: InteractiveTooltip(enable: true, color: Colors.red));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.now(), 35),
      SalesData(DateTime.utc(2003, DateTime.november, 9), 28),
      SalesData(DateTime.utc(2002, DateTime.november, 9), 34),
      SalesData(DateTime.utc(2001, DateTime.november, 9), 32),
      SalesData(DateTime.utc(2000, DateTime.november, 9), 40)
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    trackballBehavior: _trackballBehavior,
                    zoomPanBehavior: _zoomPanBehavior,
                    title: ChartTitle(text: 'Line'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
          // Renders line chart
          LineSeries<SalesData, DateTime>(
              selectionBehavior: _selectionBehavior,
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales),
        ]))));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
