import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../components/util/appbar_app.dart';
import '../components/dialog/dialog_report_filter.dart';
import '../controller/report_controller.dart';
import '../model/data_sample.dart';
import '../translate/strings.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return ChangeNotifierProvider.value(
          value: context.read<ReportController>(),
          child: const ReportFilterDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportController = context.watch<ReportController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.report_title)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => _showFilterDialog(context),
              tooltip: Translate.getString(Texts.report_filter),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: (reportController.isLoading)
                ? const Center(child: CircularProgressIndicator())
                : (reportController.chartData.isEmpty)
                ? Center(child: Text(reportController.reportTitle))
                : SfCircularChart(
              title: ChartTitle(text: reportController.reportTitle),
              series: _getDynamicDoughnutSeries(reportController.chartData),
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.bottom,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDynamicDoughnutSeries(
      List<ChartSampleData> data) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        explode: true,
        dataSource: data,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
        ),
      )
    ];
  }
}