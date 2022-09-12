import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late List<ChartData> _charData;
  late CrosshairBehavior _crosshairBehavior;

  @override
  void initState() {
    _charData = getChartData();
    _crosshairBehavior = CrosshairBehavior(
        enable: true,
        lineColor: Colors.red,
        lineDashArray: <double>[5, 5],
        lineWidth: 2,
        lineType: CrosshairLineType.vertical);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    title: ChartTitle(text: 'Range Area'),
                    primaryXAxis: DateTimeAxis(),
                    crosshairBehavior: _crosshairBehavior,
                    series: <ChartSeries>[
          RangeAreaSeries<ChartData, DateTime>(
            dataSource: _charData,
            xValueMapper: (ChartData data, _) => data.x,
            lowValueMapper: (ChartData data, _) => data.low,
            highValueMapper: (ChartData data, _) => data.high,
          )
        ]))));
  }

  List<ChartData> getChartData() {
    final List<ChartData> charData = [
      ChartData(DateTime.utc(2003, DateTime.november, 9), 35, 10),
      ChartData(DateTime.utc(2003, DateTime.november, 9), 28, 14),
      ChartData(DateTime.utc(2002, DateTime.november, 9), 34, 12),
      ChartData(DateTime.utc(2001, DateTime.november, 9), 32, 16),
      ChartData(DateTime.utc(2000, DateTime.november, 9), 40, 20)
    ];
    return charData;
  }
}

class ChartData {
  ChartData(this.x, this.high, this.low);
  final DateTime x;
  final double high;
  final double low;
}
