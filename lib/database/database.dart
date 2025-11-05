import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class ClientsTable extends Table {

  @override
  String get tableName => 'clients_table';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get address => text()();
  TextColumn get preferences => text()();

  IntColumn get isActive => integer().nullable()();

}

class SchedulesTable extends Table {

  @override
  String get tableName => 'schedules_table';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().customConstraint('REFERENCES clients_table(id) ON DELETE CASCADE NOT NULL')();
  IntColumn get frequency => integer().nullable()();

}

class ServiceTable extends Table {

  @override
  String get tableName => 'service_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  RealColumn get allDayValue => real()();
  RealColumn get halfDayValue => real()();

}

class ServiceScheduledTable extends Table {

  @override
  String get tableName => 'service_scheduled_table';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get serviceId => integer().customConstraint('REFERENCES service_table(id) NOT NULL')();
  IntColumn get scheduledId => integer().customConstraint('REFERENCES schedules_table(id) ON DELETE CASCADE NOT NULL')();

  IntColumn get serviceStatus => integer()();

  RealColumn get extraValue => real()();
  IntColumn get isHalfDay => integer()();

  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finishDate => dateTime()();
}

class UserTable extends Table {

  @override
  String get tableName => 'user_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get password => text()();
  TextColumn get email => text()();
  DateTimeColumn get notificationDateTime => dateTime()();

}

@DriftDatabase(tables: [UserTable, ClientsTable, ServiceTable, ServiceScheduledTable, SchedulesTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        }
    );
  }

  Future<List<ClientsTableData>> fetchAllClients() => select(clientsTable).get();
  Future<int> insertClient(ClientsTableCompanion client) => into(clientsTable).insert(client);
  Future<int> updateClient(ClientsTableCompanion client) => update(clientsTable).write(client);
  Future<int> removeClient(ClientsTableCompanion client) => delete(clientsTable).delete(client);

  Future<int> removeClientAndEvents(ClientsTableCompanion client) async {
    await removeClient(ClientsTableCompanion(id: client.id));
    return await (delete(schedulesTable)..where((tbl) => tbl.clientId.equals(client.id.value))).go();
  }

  Future<void> deleteClient(int clientId) async {
    await (delete(clientsTable)..where((tbl) => tbl.id.equals(clientId))).go();
  }

  Future<List<ServiceScheduledTableData>> fetchAllServiceScheduled() => select(serviceScheduledTable).get();
  Future<int> insertServiceScheduled(ServiceScheduledTableCompanion serviceScheduled) => into(serviceScheduledTable).insert(serviceScheduled);
  Future<int> updateServiceScheduled(ServiceScheduledTableCompanion serviceScheduled) => update(serviceScheduledTable).write(serviceScheduled);

  Future<List<ServiceTableData>> fetchAllServices() => select(serviceTable).get();
  Future<int> insertService(ServiceTableCompanion service) => into(serviceTable).insert(service);
  Future<int> updateService(ServiceTableCompanion service) => update(serviceTable).write(service);

  Future<List<SchedulesTableData>> fetchAllEvents() => select(schedulesTable).get();
  Future<int> insertEvent(SchedulesTableCompanion schedule) => into(schedulesTable).insert(schedule);
  Future<int> updateEvent(SchedulesTableCompanion schedule) => update(schedulesTable).write(schedule);

  Future<List<UserTableData>> fetchUser() => select(userTable).get();
  Future<int> insertUser(UserTableCompanion user) => into(userTable).insert(user);

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'radiateclean.db'));
    final db = NativeDatabase(file);

    return db;
  });


}




