import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:readiate_clean/model/enum/enum_type_of_work.dart';
import 'package:readiate_clean/model/event.dart';

import '../components/util/snack_bar_info.dart';
import '../database/database.dart';
import '../translate/strings.dart';

class EventController extends ChangeNotifier {
  List<ClientsTableData> clientList = [];
  List<ServiceTableData> serviceList = [];
  List<SchedulesTableData> eventList = [];
  List<ServiceScheduledTableData> serviceScheduledList = [];

  List<ServiceScheduledTableData> serviceSortedByDate = [];
  List<Event> eventListSorted = [];
  List<Event> eventListSortedByDate = [];

  ClientsTableData? selectedClient;
  ServiceTableData? selectedService;
  DateTime? selectedDate;
  TypeOfWork selectedTypeOfWork = TypeOfWork.allDay;

  final MyDatabase db;

  EventController(this.db) {
    init();
  }

  void init() {
    getAllServices(false);
    getAllClients(false);
    getAllServicesScheduled(false);
    getAllEvents(false).then((value) {
      _populateEventList();

      eventListSortedByDate.clear();

      for (Event element in eventListSorted) {
        if (element.serviceScheduled.date.isAfter(DateTime.now())) {
          eventListSortedByDate.add(element);
        }
      }

      notifyListeners();
    });
  }

  void _populateEventList() {
    eventListSorted.clear();
    for (ServiceScheduledTableData serviceIndex in serviceSortedByDate) {
      final SchedulesTableData? schedule = eventList
          .cast<SchedulesTableData?>()
          .firstWhere(
            (element) => element!.id == serviceIndex.scheduledId,
            orElse: () => null,
          );

      if (schedule == null) {
        continue;
      }

      final ClientsTableData? client = clientList
          .cast<ClientsTableData?>()
          .firstWhere(
            (element) => element!.id == schedule.clientId,
            orElse: () => null,
          );

      final ServiceTableData? service = serviceList
          .cast<ServiceTableData?>()
          .firstWhere(
            (element) => element!.id == serviceIndex.serviceId,
            orElse: () => null,
          );

      if (client != null && service != null) {
        eventListSorted.add(Event(client, serviceIndex, schedule, service));
      }
    }
  }

  Future getAllServices(bool isNeedToNotify) async {
    await db.fetchAllServices().then((value) {
      serviceList = value;
      if (isNeedToNotify) {
        notifyListeners();
      }
    });
  }

  Future getAllClients(bool isNeedToNotify) async {
    await db.fetchAllClients().then((value) {
      clientList = value;
      if (isNeedToNotify) {
        notifyListeners();
      }
    });
  }

  Future getAllEvents(bool isNeedToNotify) async {
    await db.fetchAllEvents().then((value) {
      eventList = value;
      if (isNeedToNotify) {
        notifyListeners();
      }
    });
  }

  Future getAllServicesScheduled(bool isNeedToNotify) async {
    await db.fetchAllServiceScheduled().then((value) {
      serviceScheduledList = value;
      if (isNeedToNotify) {
        notifyListeners();
      }
      _sortServiceScheduledList();
    });
  }

  int _tempScheduleId = 0;

  Future addEvent(TypeOfWork isHalfDay, Frequency frequency) async {
    await _addScheduled(selectedClient!.id, frequency).then((value) {
      if (_tempScheduleId != 0) {
        _addServiceScheduled(
          _tempScheduleId,
          selectedService!.id,
          selectedDate!,
          isHalfDay,
        );
        _tempScheduleId = 0;
        getAllServicesScheduled(false);
      }
      notifyListeners();
    });
  }

  Future _addScheduled(int clientId, Frequency frequency) async {
    SchedulesTableCompanion schedule = SchedulesTableCompanion(
      clientId: Value(clientId),
      frequency: Value(frequency.index),
    );

    await db.insertEvent(schedule).then((value) {
      _tempScheduleId = value;
    });
  }

  Future _addServiceScheduled(
    int scheduledId,
    int serviceId,
    DateTime date,
    TypeOfWork isHalfDay,
  ) async {
    ServiceScheduledTableCompanion serviceScheduled =
        ServiceScheduledTableCompanion(
          scheduledId: Value(scheduledId),
          serviceId: Value(serviceId),
          serviceStatus: Value(ServiceStatus.scheduled.index),
          date: Value(date),
          extraValue: const Value(0),
          finishDate: Value(DateTime.now()),
          isHalfDay: Value(isHalfDay.index),
        );

    await db.insertServiceScheduled(serviceScheduled).then((value) {
      selectedDate = null;
      selectedService = null;
      selectedClient = null;
      init();
    });
  }

  Future cancelEvent(int serviceScheduledId) async {
    eventListSorted.removeWhere(
      (event) => event.serviceScheduled.id == serviceScheduledId,
    );
    eventListSortedByDate.removeWhere(
      (event) => event.serviceScheduled.id == serviceScheduledId,
    );
    serviceScheduledList.removeWhere((s) => s.id == serviceScheduledId);

    notifyListeners();
    await db
        .updateServiceScheduled(
          ServiceScheduledTableCompanion(
            id: Value(serviceScheduledId),
            serviceStatus: Value(ServiceStatus.canceled.index),
          ),
        )
        .then((value) {})
        .onError((error, stackTrace) {
          print("Error trying to cancel on database: $error");
        });
  }

  Future<List<ClientsTableData>> getDropButtonClients() async {
    return db.fetchAllClients();
  }

  Future<List<ServiceTableData>> getDropButtonServices() async {
    return db.fetchAllServices();
  }

  void _sortServiceScheduledList() {
    serviceSortedByDate =
        serviceScheduledList
            .where(
              (event) =>
                  event.serviceStatus != ServiceStatus.finish.index &&
                  event.serviceStatus != ServiceStatus.canceled.index &&
                  event.date.isBefore(
                    DateTime.now().add(const Duration(days: 7)),
                  ),
            )
            .toList()
          ..sort((a, b) => a.date.compareTo(b.date));
  }

  ClientsTableData? getClientById(int id) {
    if (eventList.isEmpty) {
      return null;
    }
    return clientList.where((element) => element.id == id).first;
  }

  SchedulesTableData? getScheduleById(int id) {
    if (eventList.isEmpty) {
      return null;
    }
    return eventList.where((element) => element.id == id).first;
  }

  void sortListBySelectedDay(DateTime selectedDay) {
    eventListSortedByDate.clear();

    for (Event eventIndex in eventListSorted) {
      if (eventIndex.serviceScheduled.date.isBefore(
        selectedDay.add(const Duration(days: 7)),
      )) {
        if (eventIndex.serviceScheduled.date.isAfter(
          selectedDay.subtract(const Duration(days: 1)),
        )) {
          eventListSortedByDate.add(eventIndex);
        }
      }
    }
    notifyListeners();
  }

  bool validateInput(BuildContext context) {
    if (selectedDate == null) {
      SnackBarInfo(
        text: Translate.getString(Texts.invalid_input_date),
        context: context,
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      return false;
    }

    if (selectedClient == null) {
      SnackBarInfo(
        text: Translate.getString(Texts.invalid_input_client_not_selected),
        context: context,
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      return false;
    }

    if (selectedService == null) {
      SnackBarInfo(
        text: Translate.getString(Texts.invalid_input_service_not_selected),
        context: context,
        textColor: Colors.white,
        backgroundColor: Colors.red,
      );
      return false;
    }

    return true;
  }
}
