import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

import '../database/database.dart';
import '../provider/database_provider.dart';

class ServicesController extends ChangeNotifier {
  List serviceList = [];
  final MyDatabase db;

  ServicesController(this.db);

  Future getAllServices() async {
    await db.fetchAllServices().then(
      (value) {
        serviceList = value;
        notifyListeners();
      },
    );
  }

  Future addService(String description, double allDayValue, double halfDayValue) async {
    ServiceTableCompanion service = ServiceTableCompanion(
      description: Value(description),
      allDayValue: Value(allDayValue),
      halfDayValue: Value(halfDayValue),
    );

    await db.insertService(service).then(
      (value) {
        getAllServices();
      },
    );
  }

  Future updateService(int id, String description, double allDayValue, double halfDayValue) async {
    await db.updateService(
      ServiceTableCompanion(
        id: Value(id),
        description: Value(description),
        allDayValue: Value(allDayValue),
        halfDayValue: Value(halfDayValue),
      ),
    ).then((value) {
      getAllServices();
    },);
  }

  Future deleteService(int id) async {
    await db.deleteService(id).then((value) {
      getAllServices();
    },);
  }

}
