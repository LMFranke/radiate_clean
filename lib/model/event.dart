import 'package:readiate_clean/database/database.dart';

class Event {

  final ClientsTableData client;
  final ServiceScheduledTableData serviceScheduled;
  final SchedulesTableData schedule;
  final ServiceTableData service;

  Event(this.client, this.serviceScheduled, this.schedule, this.service);

}