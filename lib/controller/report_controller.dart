// lib/controller/report_controller.dart

import 'package:flutter/cupertino.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/model/data_sample.dart';

enum ReportType { byClient, byService }

class ReportController extends ChangeNotifier {
  final MyDatabase db;

  ReportController(this.db);

  // Estado que a View (report_screen) vai ouvir
  List<ChartSampleData> chartData = [];
  String reportTitle = "Relatório (Selecione um filtro)";
  bool isLoading = false;

  Future<void> generateReport({
    required ReportType reportType,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    isLoading = true;
    chartData.clear();
    notifyListeners();

    // 1. Buscar todos os dados necessários
    // (Otimização: idealmente, faríamos queries SQL complexas com JOINs)
    // Por simplicidade, vamos buscar as tabelas e processar no Dart.
    final allScheduledServices = await db.fetchAllServiceScheduled();
    final allClients = await db.fetchAllClients();
    final allServices = await db.fetchAllServices();
    final allSchedules = await db.fetchAllEvents();

    // 2. Filtrar serviços agendados pelo período selecionado
    final filteredScheduledServices = allScheduledServices.where((scheduled) {
      return (scheduled.date.isAfter(startDate) || scheduled.date.isAtSameMomentAs(startDate)) &&
          (scheduled.date.isBefore(endDate)   || scheduled.date.isAtSameMomentAs(endDate));
    }).toList();

    // 3. Processar os dados com base no tipo de relatório
    if (reportType == ReportType.byClient) {
      reportTitle = "Relatório por Cliente";
      _processByClient(filteredScheduledServices, allClients, allServices, allSchedules);
    } else {
      reportTitle = "Relatório por Serviço";
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
    // Mapa para agrupar os valores por ID do cliente
    Map<int, double> clientValueMap = {};

    for (var scheduled in filteredServices) {
      // Encontrar o serviço para saber o valor
      final serviceInfo = allServices.firstWhere((s) => s.id == scheduled.serviceId);
      // Encontrar o agendamento (schedule) para saber o ID do cliente
      final scheduleInfo = allSchedules.firstWhere((s) => s.id == scheduled.scheduledId);

      final clientId = scheduleInfo.clientId;
      final value = (scheduled.isHalfDay == 1 ? serviceInfo.halfDayValue : serviceInfo.allDayValue) + scheduled.extraValue;

      // Adicionar (ou somar) ao mapa
      clientValueMap[clientId] = (clientValueMap[clientId] ?? 0) + value;
    }

    // Converter o Mapa para a Lista de ChartSampleData
    chartData = clientValueMap.entries.map((entry) {
      final clientName = allClients.firstWhere((c) => c.id == entry.key).name;
      return ChartSampleData(
        x: clientName,
        y: entry.value,
        text: 'R\$ ${entry.value.toStringAsFixed(2)}', // Opcional: para mostrar o valor no gráfico
      );
    }).toList();
  }

  void _processByService(
      List<ServiceScheduledTableData> filteredServices,
      List<ServiceTableData> allServices,
      ) {
    // Mapa para agrupar os valores por ID do serviço
    Map<int, double> serviceValueMap = {};

    for (var scheduled in filteredServices) {
      // Encontrar o serviço para saber o valor
      final serviceInfo = allServices.firstWhere((s) => s.id == scheduled.serviceId);
      final value = (scheduled.isHalfDay == 1 ? serviceInfo.halfDayValue : serviceInfo.allDayValue) + scheduled.extraValue;

      // Adicionar (ou somar) ao mapa
      serviceValueMap[scheduled.serviceId] = (serviceValueMap[scheduled.serviceId] ?? 0) + value;
    }

    // Converter o Mapa para a Lista de ChartSampleData
    chartData = serviceValueMap.entries.map((entry) {
      final serviceName = allServices.firstWhere((s) => s.id == entry.key).description;
      return ChartSampleData(
        x: serviceName,
        y: entry.value,
        text: 'R\$ ${entry.value.toStringAsFixed(2)}', // Opcional: para mostrar o valor
      );
    }).toList();
  }
}