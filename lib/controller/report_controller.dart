import 'package:flutter/cupertino.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/model/data_sample.dart';
import 'package:readiate_clean/translate/strings.dart';

enum ReportType { byClient, byService }

class ReportController extends ChangeNotifier {
  final MyDatabase db;

  ReportController(this.db);

  List<ChartSampleData> chartData = [];
  String reportTitle = Translate.getString(Texts.report_filter_select_title);
  bool isLoading = false;

  Future<void> generateReport({
    required ReportType reportType,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    isLoading = true;
    chartData.clear();
    notifyListeners();

    final allScheduledServices = await db.fetchAllServiceScheduled();
    final allClients = await db.fetchAllClients();
    final allServices = await db.fetchAllServices();
    final allSchedules = await db.fetchAllEvents();

    final filteredScheduledServices = allScheduledServices.where((scheduled) {
      return (scheduled.date.isAfter(startDate) || scheduled.date.isAtSameMomentAs(startDate)) &&
          (scheduled.date.isBefore(endDate)   || scheduled.date.isAtSameMomentAs(endDate));
    }).toList();

    if (reportType == ReportType.byClient) {
      reportTitle = Translate.getString(Texts.filter_by_client_title);
      _processByClient(filteredScheduledServices, allClients, allServices, allSchedules);
    } else {
      reportTitle = Translate.getString(Texts.filter_by_service_title);
      _processByService(filteredScheduledServices, allServices);
    }

    isLoading = false;
    notifyListeners();
  }

  void _processByClient(
      List<ServiceScheduledTableData> filteredServices,
      List<ClientsTableData> allClients,
      List<ServiceTableData> allServices,
      List<SchedulesTableData> allSchedules,
      ) {
    Map<int, double> clientValueMap = {};

    for (var scheduled in filteredServices) {
      final serviceInfo = allServices.firstWhere((s) => s.id == scheduled.serviceId);
      final scheduleInfo = allSchedules.firstWhere((s) => s.id == scheduled.scheduledId);

      final clientId = scheduleInfo.clientId;
      final value = (scheduled.isHalfDay == 1 ? serviceInfo.halfDayValue : serviceInfo.allDayValue) + scheduled.extraValue;

      clientValueMap[clientId] = (clientValueMap[clientId] ?? 0) + value;
    }

    chartData = clientValueMap.entries.map((entry) {
      final clientName = allClients.firstWhere((c) => c.id == entry.key).name;
      return ChartSampleData(
        x: clientName,
        y: entry.value,
        text: 'R\$ ${entry.value.toStringAsFixed(2)}',
      );
    }).toList();
  }

  void _processByService(
      List<ServiceScheduledTableData> filteredServices,
      List<ServiceTableData> allServices,
      ) {
    Map<int, double> serviceValueMap = {};

    for (var scheduled in filteredServices) {
      final serviceInfo = allServices.firstWhere((s) => s.id == scheduled.serviceId);
      final value = (scheduled.isHalfDay == 1 ? serviceInfo.halfDayValue : serviceInfo.allDayValue) + scheduled.extraValue;

      serviceValueMap[scheduled.serviceId] = (serviceValueMap[scheduled.serviceId] ?? 0) + value;
    }

    chartData = serviceValueMap.entries.map((entry) {
      final serviceName = allServices.firstWhere((s) => s.id == entry.key).description;
      return ChartSampleData(
        x: serviceName,
        y: entry.value,
        text: 'R\$ ${entry.value.toStringAsFixed(2)}',
      );
    }).toList();
  }
}