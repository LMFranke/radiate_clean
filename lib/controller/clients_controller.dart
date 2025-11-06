import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';

import '../provider/database_provider.dart';

class ClientsController extends ChangeNotifier {
  List customerList = [];
  final MyDatabase db;

  ClientsController(this.db);

  Future getAllClients() async {
    await db.fetchAllClients().then(
      (value) {
        customerList = value;
        notifyListeners();
      },
    );
  }

  Future addClient(String name, String address, String phoneNumber, String preferences) async {
    ClientsTableCompanion client = ClientsTableCompanion(
      name: Value(name),
      address: Value(address),
      phoneNumber: Value(phoneNumber),
      preferences: Value(preferences),
    );

    await db.insertClient(client).then(
      (value) {
        getAllClients();
      },
    );
  }

  Future updateClient(int id, String name, String address, String phoneNumber, String preferences) async {
    await db.updateClient(
      ClientsTableCompanion(
        id: Value(id),
        name: Value(name),
        phoneNumber: Value(phoneNumber),
        address: Value(address),
        preferences: Value(preferences),
      ),
    )
        .then(
      (value) {
        getAllClients();
      },
    );
  }

  Future deleteClient(int id) async {
    await db.deleteClient(id).then((value) {
      getAllClients();
    },);
  }

}
