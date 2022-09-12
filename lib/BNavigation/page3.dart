import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Page3> {
  late List<GDPData> _charData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _charData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          title: ChartTitle(text: 'Radial Bar'),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            RadialBarSeries<GDPData, String>(
                dataSource: _charData,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true)
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> charData = [
      GDPData('Oceania', 1600),
      GDPData('Africa', 2490),
      GDPData('S. America', 2900),
      GDPData('Europe', 23050),
      GDPData('N. America', 24880),
      GDPData('Asia', 34390)
    ];
    return charData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}