import 'package:readiate_clean/model/enum_type_of_work.dart';

class ServiceScheduled {
  int id;
  int serviceId;
  int scheduleId;

  bool isHalfDay;
  double extraValue;
  ServiceStatus serviceStatus;

  DateTime date;
  DateTime finishDate;

  ServiceScheduled(
    this.id,
    this.serviceId,
    this.scheduleId,
    this.isHalfDay,
    this.extraValue,
    this.serviceStatus,
    this.date,
    this.finishDate,
  );

  @override
  String toString() {
    return 'ServiceScheduled{id: $id, serviceId: $serviceId, scheduleId: $scheduleId, isHalfDay: $isHalfDay, extraValue: $extraValue, serviceStatus: $serviceStatus, date: $date, finishDate: $finishDate}';
  }

}
