import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/data_sample.dart';
import '../translate/strings.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.report_title)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          SfCircularChart(
            title: ChartTitle(text: "Month report"),
            series: _getDefaultDoughnutSeries(),
            legend: const Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              title: LegendTitle(text: "Legend"),
              position: LegendPosition.bottom,
            ),
          )
        ],
      ),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          explode: true,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Chlorine', y: 55, text: '55%'),
            ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
            ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
            ChartSampleData(x: 'Sulfur', y: 3.7, text: '3.7%'),
            ChartSampleData(x: 'Calcium', y: 1.2, text: '1.2%'),
            ChartSampleData(x: 'Others', y: 1.4, text: '1.4%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
}
